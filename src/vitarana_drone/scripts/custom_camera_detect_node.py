#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import NavSatFix, Imu
import tf

import cv2
import numpy as np
import time

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from vitarana_drone.msg import DetectionFeatures

from ultralytics import YOLO

class ImageProcessUtils:
    def _pass(self):
        pass

    def _get_box_features(self, box_object):
        xyxy = box_object.xyxy[0].cpu().numpy().astype(int)
        x1, y1, x2, y2 = xyxy
        obj_id = box_object.id[0].cpu().numpy().astype(int) if box_object.id is not None else None
        obj_cls = box_object.cls[0].cpu().numpy().astype(int)
        conf = box_object.conf.item()

        return (x1, y1, x2, y2), obj_id, obj_cls, conf

    def _get_box_center(self, box: tuple) -> tuple:
        x1, y1, x2, y2 = box
        x_center = int((x1+x2) / 2)
        y_center = int((y1+y2) / 2)

        return (x_center, y_center)
    
    def _get_box_edges(self, box: tuple) -> tuple:
        x1, y1, x2, y2 = box
        width = x2 - x1
        height = y2 - y1
        return (width, height)


class ImageDetector(ImageProcessUtils):
    def __init__(self):
        super().__init__()

        rospy.init_node('camera_detection')
        
        self.condition_flag = "takeoff"
        self.drone_orientation_quaternion = [0.0, 0.0, 0.0, 0.0]
        self.imu_orientation = [0.0, 0.0, 0.0]
        self.gps_position = [0.0, 0.0, 0.0]

        self.box_corners = (0, 0, 0, 0)
        self.x_center = 0
        self.y_center = 0

        self.condition_sub = rospy.Subscriber("/edrone/condition", String, self.condition_callback)
        self.condition_pub = rospy.Publisher("/edrone/condition", String, queue_size=10)

        self.image_sub = rospy.Subscriber("/edrone/camera/image_raw", Image, self.image_callback)
        self.detected_object_feature_pub = rospy.Publisher("/edrone/camera/object_feature", DetectionFeatures, queue_size=10)

        rospy.Subscriber("edrone/imu/data", Imu, self.imu_callback)
        rospy.Subscriber("edrone/gps", NavSatFix, self.gps_callback)
        
        self.bridge = CvBridge()
        self.model = YOLO(r'/home/esaddogan/edrone_ws/src/vitarana_drone/ai_models/best.pt')
        self.rate = rospy.Rate(3)

        

    def imu_callback(self, data):
        self.drone_orientation_quaternion[0] = data.orientation.x
        self.drone_orientation_quaternion[1] = data.orientation.y
        self.drone_orientation_quaternion[2] = data.orientation.z
        self.drone_orientation_quaternion[3] = data.orientation.w
        (self.imu_orientation[0], self.imu_orientation[1], self.imu_orientation[2]) = tf.transformations.euler_from_quaternion([self.drone_orientation_quaternion[0], self.drone_orientation_quaternion[1], self.drone_orientation_quaternion[2], self.drone_orientation_quaternion[3]])
        # rospy.loginfo("IMU data received: {}".format(self.imu_orientation))
        self.rate.sleep()

    def gps_callback(self, data):
        self.gps_position[0] = data.latitude
        self.gps_position[1] = data.longitude
        self.gps_position[2] = data.altitude
        # rospy.loginfo("GPS data received: {}".format(self.gps_position))
        # self.rate.sleep()

    def condition_callback(self, data):
        self.condition_flag = data.data

    def condition_publish(self, condition):
        self.condition_pub.publish(condition)
        self.rate.sleep()

    def image_callback(self, data):  
        image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        result = self.model(image)

        for box in result[0].boxes:
            self.box_corners, obj_id, obj_cls, conf = self._get_box_features(box)
            self.x_center, self.y_center = self._get_box_center(self.box_corners)

            cv2.rectangle(image, (self.box_corners[0], self.box_corners[1]), (self.box_corners[2], self.box_corners[3]), (0, 255, 0), 1)
            cv2.putText(image, f'{obj_cls} {conf:.2f}', (self.box_corners[0], self.box_corners[1] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (36,255,12), 1)
            
        cv2.imshow('camera_feed', image)
        cv2.waitKey(1)

        self.publish_image_features(self.box_corners)
        self.rate.sleep()

    def publish_image_features(self, box_corners): 
        detection_features = DetectionFeatures()

        detection_features.x = self._get_box_center(box_corners)[0]
        detection_features.y = self._get_box_center(box_corners)[1]
        detection_features.width = self._get_box_edges(box_corners)[0]
        detection_features.height = self._get_box_edges(box_corners)[1]

        detection_features.altitude = self.gps_position[2]
        detection_features.latitude = self.gps_position[0]
        detection_features.longitude = self.gps_position[1]

        detection_features.roll = self.imu_orientation[0]
        detection_features.pitch = self.imu_orientation[1]
        detection_features.yaw = self.imu_orientation[2]

        self.detected_object_feature_pub.publish(detection_features)
        self.rate.sleep()

    def main(self):
        try:
            rospy.spin()
        except KeyboardInterrupt:
            rospy.loginfo("shutting down")
        finally:
            cv2.destroyAllWindows()

if __name__ == '__main__':
    try:
        detector = ImageDetector()
        detector.main()
    except rospy.ROSInterruptException:
        pass