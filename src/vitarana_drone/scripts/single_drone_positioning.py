#!/usr/bin/env python3

import rospy

from vitarana_drone.msg import ImageFeatures

class SingleDronePositioning:
    def __init__(self):
        rospy.init_node('single_drone_positioning')
        self.image_features_sub = rospy.Subscriber("/edrone/camera/image_features", ImageFeatures, self.image_features_callback)

    def image_features_callback(self, data):
        height = data.height
        width = data.width
        fow = data.fow
        angle_roll = data.angle_roll
        angle_pitch = data.angle_pitch
        angle_yaw = data.angle_yaw
        
        rospy.loginfo("Height: %s, Width: %s, Field of View: %s, Roll: %s, Pitch: %s, Yaw: %s", height, width, fow, angle_roll, angle_pitch, angle_yaw)
    
    def main(self):
        try:
            rospy.spin()
        except rospy.ROSInterruptException:
            rospy.loginfo("Node terminated.")

if __name__ == '__main__':
    try:
        positioning = SingleDronePositioning()
        positioning.main()
    except rospy.ROSInterruptException:
        rospy.loginfo("Node terminated.")

