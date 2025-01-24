#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

from vitarana_drone.msg import ImageFeatures

class SingleDronePositioning:
    def __init__(self):
        rospy.init_node('single_drone_positioning')

        self.condition_flag = "takeoff"

        self.condition_sub = rospy.Subscriber("/edrone/condition", String, self.condition_callback)
        self.condition_pub = rospy.Publisher("/edrone/condition", String, queue_size=10)

        self.image_features_sub = rospy.Subscriber("/edrone/camera/object_feature", ImageFeatures, self.image_features_callback)
        self.rate = rospy.Rate(3)
        
        rospy.loginfo("Single Drone Positioning Node Initialized")

    def condition_callback(self, data):
        self.condition_flag = data.data

    def condition_publish(self, condition):
        self.condition_pub.publish(condition)
        self.rate.sleep()

    def image_features_callback(self, data):
        height = data.height
        width = data.width
        fow = data.fow
        angle_roll = data.angle_roll
        angle_pitch = data.angle_pitch
        angle_yaw = data.angle_yaw
        
        rospy.loginfo(f"Height: {height}, Width: {width}, Field of View: {fow}, Roll: {angle_roll}, Pitch: {angle_pitch}, Yaw: {angle_yaw}")

    def main(self):
        try:
            rospy.spin()
        except KeyboardInterrupt:
            rospy.loginfo("shutting down")

if __name__ == '__main__':
    try:
        positioning = SingleDronePositioning()
        positioning.main()
    except rospy.ROSInterruptException:
        rospy.loginfo("Node terminated.")

