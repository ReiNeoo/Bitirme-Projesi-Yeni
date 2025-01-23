#!/usr/bin/env python3

import rospy
import numpy as np
import tf
import time
from math import cos, radians
from typing import List, Tuple

from vitarana_drone.msg import edrone_cmd
from sensor_msgs.msg import NavSatFix, Imu
from std_msgs.msg import Float32

class PIDController:
    """PID controller for a single axis of control"""
    def __init__(self, kp: float, ki: float, kd: float, min_output: float, max_output: float):
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.min_output = min_output
        self.max_output = max_output
        
        self.error = 0.0
        self.prev_error = 0.0
        self.sum_error = 0.0
        
    def compute(self, setpoint: float, current_value: float) -> float:
        """Compute PID output based on setpoint and current value"""
        self.error = setpoint - current_value
        self.sum_error += self.error
        d_error = self.error - self.prev_error
        self.prev_error = self.error
        
        output = (self.kp * self.error + 
                 self.ki * self.sum_error + 
                 self.kd * d_error)
                 
        return np.clip(output, self.min_output, self.max_output)

class DroneController:
    """Main drone control node handling position control and waypoint navigation"""
    def __init__(self):
        rospy.init_node('position_controller')
        
        # Initialize controllers for each axis
        self.lat_controller = PIDController(1080000, 0, 57600000, -300, 300)
        self.lon_controller = PIDController(1140000, 0, 57900000, -300, 300)
        self.alt_controller = PIDController(48, 0, 3000, -500, 500)
        
        # Initialize drone state
        self.position = [0.0, 0.0, 0.0]  # [latitude, longitude, altitude]
        self.orientation_quaternion = [0.0, 0.0, 0.0, 0.0]
        self.orientation_euler = [0.0, 0.0, 0.0]
        
        # Initialize command message
        self.cmd = edrone_cmd()
        self._reset_command()
        
        # Set up publishers and subscribers
        self._setup_ros_interface()
    
    def _setup_ros_interface(self):
        """Initialize all ROS publishers and subscribers"""
        # Publishers
        self.cmd_pub = rospy.Publisher('/drone_command', edrone_cmd, queue_size=1)
        self.error_pubs = {
            'lat': rospy.Publisher('/latitude_error', Float32, queue_size=1),
            'lon': rospy.Publisher('/longitude_error', Float32, queue_size=1),
            'alt': rospy.Publisher('/altitude_error', Float32, queue_size=1)
        }
        
        # Subscribers
        rospy.Subscriber('/edrone/gps', NavSatFix, self._gps_callback)
        rospy.Subscriber('/edrone/imu/data', Imu, self._imu_callback)
    
    def _gps_callback(self, msg: NavSatFix):
        """Handle incoming GPS data"""
        self.position = [msg.latitude, msg.longitude, msg.altitude]
    
    def _imu_callback(self, msg: Imu):
        """Handle incoming IMU data"""
        self.orientation_quaternion = [
            msg.orientation.x, msg.orientation.y,
            msg.orientation.z, msg.orientation.w
        ]
        self.orientation_euler = list(tf.transformations.euler_from_quaternion(
            self.orientation_quaternion))
    
    def _reset_command(self):
        """Reset control commands to neutral position"""
        self.cmd.rcRoll = 1500.0
        self.cmd.rcPitch = 1500.0
        self.cmd.rcYaw = 1500.0
        self.cmd.rcThrottle = 1500.0
    
    def compute_control(self, setpoint: List[float]):
        """Compute control outputs for all axes"""
        # Get PID outputs for each axis
        lat_out = self.lat_controller.compute(setpoint[0], self.position[0])
        lon_out = self.lon_controller.compute(setpoint[1], self.position[1])
        alt_out = self.alt_controller.compute(setpoint[2], self.position[2])
        
        # Convert to roll, pitch, throttle commands
        yaw = self.orientation_euler[2]
        self.cmd.rcRoll = 1500 + lat_out*np.cos(yaw) - lon_out*np.sin(yaw)
        self.cmd.rcPitch = 1500 + lat_out*np.sin(yaw) + lon_out*np.cos(yaw)
        self.cmd.rcThrottle = 1500 + alt_out
        
        # Apply command limits
        self.cmd.rcRoll = np.clip(self.cmd.rcRoll, 1200, 1800)
        self.cmd.rcPitch = np.clip(self.cmd.rcPitch, 1200, 1800)
        self.cmd.rcThrottle = np.clip(self.cmd.rcThrottle, 1000, 2000)
        
        # Publish command
        self.cmd_pub.publish(self.cmd)

def main():
    controller = DroneController()
    rate = rospy.Rate(20)  # 20Hz control loop
    
    # Example waypoints in local coordinates
    waypoints = [
        [0, 0, 5.0],
        [5.0, 0, 5.0],
        [10.0, 0, 5.0]
    ]
    
    current_waypoint = 0
    
    while not rospy.is_shutdown() and current_waypoint < len(waypoints):
        setpoint = waypoints[current_waypoint]
        controller.compute_control(setpoint)
        rate.sleep()
        current_waypoint += 1

if __name__ == '__main__':
    try:
        t = time.time()
        while time.time() -t < 10:
            pass
        main()
    except rospy.ROSInterruptException:
        pass
