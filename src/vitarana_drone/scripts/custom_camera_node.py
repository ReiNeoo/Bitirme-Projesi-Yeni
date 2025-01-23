#!/usr/bin/env python3

import cv2
import rospy
import numpy as np

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

# from ultralytics import YOLO

class ImageDetector:
    def __init__(self):
        rospy.init_node('camera_detection')
        self.image_sub = rospy.Subscriber("/edrone/camera/image_raw", Image, self.image_callback)
        self.bridge = CvBridge()

    def image_callback(self, data):
        image = self.bridge.imgmsg_to_cv2(data, "bgr8")
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