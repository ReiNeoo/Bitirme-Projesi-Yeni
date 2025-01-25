#!/usr/bin/env python3

import rospy

import time 

from std_msgs.msg import String
from vitarana_drone.msg import TargetPosition, TargetGpsPosition

class WaypointController:
    def __init__(self):
        rospy.init_node('waypoint_controller')

        self.condition_flag = "takeoff"
        self.waypoint_x = 0
        self.waypoint_y = 0
        self.waypoint_z = 0

        self.condition_sub = rospy.Subscriber("/edrone/condition", String, self.condition_callback)
        self.condition_pub = rospy.Publisher("/edrone/condition", String, queue_size=10)
        
        self.target_position_pub = rospy.Publisher("/edrone/waypoint", TargetPosition, queue_size=10)
        # self.target_position_sub = rospy.Subscriber("/edrone/detected_waypoint", TargetPosition, self.target_position_callback)

        self.attack_point_sub = rospy.Subscriber("/edrone/target_position",TargetGpsPosition, self.attack_point_callback)

        # Timer for hover publishing
        self.hover_timer = rospy.Timer(rospy.Duration(0.1), self.hover_callback)  # 3 Hz

    def hover_callback(self, event):
        if self.condition_flag == "hover":
            self.waypoint_x = 0.0
            self.waypoint_y = 0.0
            self.waypoint_z = 5.1
            self.next_position_publish(self.waypoint_x, self.waypoint_y, self.waypoint_z)

    def condition_callback(self, data):
        self.condition_flag = data.data
        rospy.loginfo("Waypoint Controller Node Condition: %s", self.condition_flag)
    
    def attack_point_callback(self, data):
        rospy.loginfo("Attack point detected...")
        # if self.condition_callback == "attack":
        rospy.loginfo("ATTACKING ENEMY...")
        self.waypoint_x = data.longitude
        self.waypoint_y = data.latitude
        self.waypoint_z = 1.0

        self.next_position_publish(self.waypoint_x, self.waypoint_y, self.waypoint_z)

    # def target_position_callback(self, data):
    #     self.waypoint_x = data.x
    #     self.waypoint_y = data.y
    #     self.waypoint_z = data.z
    #     self.condition_publish("attack")
    #     self.next_position_publish(self.waypoint_x, self.waypoint_y, self.waypoint_z)
    #     rospy.loginfo("Waypoint: x: %f, y: %f, z: %f", self.waypoint_x, self.waypoint_y, self.waypoint_z)

    def next_position_publish(self, x, y, z):
        target_position = TargetPosition()
        target_position.x = x
        target_position.y = y
        target_position.z = z
        self.target_position_pub.publish(target_position)
        # rospy.loginfo("Next Position: x: %f, y: %f, z: %f", x, y, z)

    def condition_publish(self, condition):
        self.condition_pub.publish(condition)
        rospy.loginfo("Way Point Controller Condition: %s", condition)

    def takeoff(self):
        rospy.loginfo("Takeing off")
        self.waypoint_x = 0.0
        self.waypoint_y = 0.0
        self.waypoint_z = 5.0
        self.next_position_publish(self.waypoint_x, self.waypoint_y, self.waypoint_z)

    def run(self):
        time.sleep(4)
        self.takeoff()
        self.condition_publish("hover")
        rospy.spin() 

if __name__ == '__main__': 
    waypoint_controller = WaypointController()
    waypoint_controller.run()