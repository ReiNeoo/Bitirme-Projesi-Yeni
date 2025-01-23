#!/usr/bin/env python3

import rospy

from std_msgs.msg import String
from vitarana_drone.msg import TargetPosition

class WaypointController:
    def __init__(self):
        rospy.init_node('waypoint_controller')
        
        self.condition_flag = "takeoff"
        self.waypoint_x = 0
        self.waypoint_y = 0
        self.waypoint_z = 0 

        self.condition_sub = rospy.Subscriber("/edrone/condition", String, self.condition_callback)
        self.condition_pub = rospy.Publisher("/edrone/condition", String, queue_size=10)

        # self.target_position_sub = rospy.Subscriber("/edrone/target_waypoint", TargetPosition, self.target_position_callback)
        self.target_position_pub = rospy.Publisher("/edrone/waypoint", TargetPosition, queue_size=10)

        self.rate = rospy.Rate(3)
        
    
    def condition_callback(self, data):
        self.condition_flag = data.data 

    def condition_publish(self, condition):
        self.condition_pub.publish(condition)
        self.rate.sleep()

    def target_position_publish(self, x, y, z):
        target_position = TargetPosition()
        target_position.x = x
        target_position.y = y
        target_position.z = z
        self.target_position_pub.publish(target_position)
        self.rate.sleep()

    def set_waypoint(self):
        if self.condition_flag == "takeoff":
            self.waypoint_x = 0
            self.waypoint_y = 0
            self.waypoint_z = 5
            self.target_position_publish(self.waypoint_x, self.waypoint_y, self.waypoint_z)
            self.condition_publish("hover")        
        


