#!/usr/bin/env python3

import cv2
import rospy
import numpy as np

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

from ultralytics import YOLO

class ImageDetector:
    def __init__(self):
        rospy.init_node('camera_detection')
        self.image_sub = rospy.Subscriber("/edrone/camera/image_raw", Image, self.image_callback)
        self.bridge = CvBridge()
        self.model = YOLO(r'/home/esaddogan/edrone_ws/src/vitarana_drone/ai_models/last.pt')

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
    
    def _get_track_points(self, current_tracked_object, point):
        start_point = current_tracked_object.get(point)
        end_point = current_tracked_object.get(point + 1) if current_tracked_object._len_() > 1 else self._pass()
        return start_point,end_point

    def image_callback(self, data):
        image = self.bridge.imgmsg_to_cv2(data, "bgr8")

        result = self.model(image)

        for box in result[0].boxes:
            box_corners, obj_id, obj_cls, conf = self._get_box_features(box)
            x_center, y_center = self._get_box_center(box_corners)

        cv2.rectangle(image, (box_corners[0], box_corners[1]), (box_corners[2], box_corners[3]), (0, 255, 0), 2)
        cv2.putText(image, f'{obj_cls} {conf}', (box_corners[0], box_corners[1] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (36,255,12), 1)
        cv2.imshow('camera_feed', image)
        cv2.waitKey(1)

    def main(self):
        try:
            rospy.spin()
        except KeyboardInterrupt:
            rospy.loginfo("shutting down")
        finally:
            cv2.destroyAllWindows()

if __name__ == "__main__":
    try:
        detector = ImageDetector()
        detector.main()
    except rospy.ROSInterruptException:
        pass