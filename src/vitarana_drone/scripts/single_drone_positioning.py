#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from math import cos, radians

from vitarana_drone.msg import DetectionFeatures, TargetGpsPosition
from calculate_detected_object_location import ObjectGPSLocator

class SingleDronePositioningUtils:
    def __init__(self):
        pass
    
    def _pass(self):
        pass

    def local_to_gps(self, long, lat) -> tuple:
        origin_lat = 19.0
        origin_lon = 72.0
        constant = 111319.9

        gps_x = (long/constant) + origin_lat    
        gps_y = (lat/(constant * cos(radians(origin_lat)))) + origin_lon

        return gps_x, gps_y
    
    def gps_to_local(self, gps_coord: list) -> tuple:
        origin_lat = 19.0
        origin_lon = 72.0
        constant = 111319.9

        x = (gps_coord[0] - origin_lat) * constant
        y = (gps_coord[1] - origin_lon) * constant * cos(radians(origin_lat))
        
        return x, y

class SingleDronePositioning(SingleDronePositioningUtils):
    def __init__(self):
        super().__init__()

        rospy.init_node('single_drone_positioning')

        self.camera_featrues = [1.3962634, 320, 256]
        self.bounding_box = [0, 0, 0, 0]
        self.drone_height = 0.0
        self.drone_position = [0.0, 0.0]
        self.drone_orientation = [0.0, 0.0, 0.0]

        self.condition_flag = "takeoff"
        self.detection_flag = False

        self.condition_sub = rospy.Subscriber("/edrone/condition", String, self.condition_callback)
        self.condition_pub = rospy.Publisher("/edrone/condition", String, queue_size=10)

        self.image_features_sub = rospy.Subscriber("/edrone/camera/object_feature", DetectionFeatures, self.image_features_callback)
        self.target_position_pub = rospy.Publisher("/edrone/camera/target_position", TargetGpsPosition, queue_size=10)
        
        self.target_location_timer = rospy.Timer(rospy.Duration(1), self.publish_object_position)
        self.object_locator = ObjectGPSLocator(self.camera_featrues)

        self.rate = rospy.Rate(1)

        rospy.loginfo("Single Drone Positioning Node Initialized")

    def condition_callback(self, data):
        self.condition_flag = data.data
        rospy.loginfo("Target Detector Node Condition: %s", self.condition_flag)

    def condition_publish(self, condition):
        self.condition_pub.publish(condition)
        rospy.loginfo("Target Detector Node Condition: %s", condition)
        self.rate.sleep()

    def image_features_callback(self, data):
        self.bounding_box[0] = data.x
        self.bounding_box[1] = data.y
        self.bounding_box[2] = data.width
        self.bounding_box[3] = data.height

        self.drone_height = data.altitude
        self.drone_position[0] = data.latitude
        self.drone_position[1] = data.longitude

        self.drone_orientation[0] = data.pitch
        self.drone_orientation[1] = data.roll
        self.drone_orientation[2] = data.yaw

        # rospy.loginfo("Image features message received")
        # _lat, _lon = self.gps_to_local(self.drone_position)
        # rospy.loginfo("BBox height: %f, Drone Latitude: %f, Drone Longitude: %f, Drone Height: %f", self.bounding_box[3], _lat, _lon, self.drone_height)

        self.detection_flag = True
        self.rate.sleep()

    def publish_object_position(self, event):
        if self.detection_flag and (self.condition_flag == "hover") and (self.drone_height > 4.7):
            # rospy.loginfo("Publishing object position")
            drone_state = {
            'height': self.drone_height,
            'gps_lat': self.drone_position[0],
            'gps_lon': self.drone_position[1],
            'pitch': self.drone_orientation[0],
            'roll': self.drone_orientation[1],
            'yaw': self.drone_orientation[2]}

            longitude, latitude = self.object_locator.calculate_object_position(self.bounding_box, 2.3, drone_state)
            lon_lat_list = [longitude, latitude]
            longitude, latitude = self.gps_to_local(lon_lat_list)

            self.target_position_pub.publish(longitude, latitude)
            rospy.loginfo("Object position published: %f, %f", longitude, latitude)
            self.condition_publish("attack")
            self.rate.sleep()

   
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

