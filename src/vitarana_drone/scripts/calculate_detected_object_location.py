#!/usr/bin/env python3

import numpy as np
from math import tan, cos, sin, pi, radians, degrees

class ObjectGPSLocator:
    def __init__(self, camera_params):
        """
        Initialize with static camera parameters
        
        camera_params: list containing
            - horizontal_fov: Horizontal field of view in radians
            - sensor_width: Camera sensor width in pixels
            - sensor_height: Camera sensor height in pixels
        """
        self.camera_params = camera_params
        
        # The Earth's radius in meters - we'll need this for GPS calculations
        self.EARTH_RADIUS = 6371000  
        self.origin_lat = 19.0
        self.origin_lon = 72.0
        
        # Calculate vertical FOV using the sensor's aspect ratio
        aspect_ratio = camera_params[2] / camera_params[1]
        self.vertical_fov = camera_params[0] * aspect_ratio

        self.focal_length = self._calculate_focal_length()

    def _calculate_focal_length(self):
        """Calculate focal length in pixels based on camera parameters"""
        return (self.camera_params[1] / 2) / tan(radians(degrees(self.camera_params[0]) / 2))

    def get_distance(self, object_pixel_height, object_real_height):
        """
        Calculate ground distance to object
        
        Args:
            object_pixel_height (int): Height of object in pixels
            object_real_height (float): Real height of object in meters
            
        Returns:
            float: Ground distance to object in meters
        """
        return (object_real_height * self.focal_length) / object_pixel_height

    def pixel_to_angle(self, pixel_x, pixel_y):
        """
        Convert pixel coordinates to angular offsets from camera center.
        This conversion is critical for determining where in the camera's field of view
        the object appears.
        """
        # Convert pixel positions to normalized coordinates (-1 to 1)
        norm_x = (pixel_x - self.camera_params[1]/2) / (self.camera_params[1]/2)
        norm_y = (pixel_y - self.camera_params[2]/2) / (self.camera_params[2]/2)
        
        # Convert to angles using FOV
        horizontal_angle = norm_x * (self.camera_params[0]/2)
        vertical_angle = norm_y * (self.vertical_fov/2)
        
        return horizontal_angle, vertical_angle

    def calculate_ground_distance(self, vertical_angle, drone_height, drone_pitch, object_height):
        """Calculate ground distance considering object height."""
        camera_angle = pi / 2 - drone_pitch
        total_angle = camera_angle + vertical_angle

        adjusted_height = drone_height - (object_height / 2)
        if adjusted_height <= 0:
            return

        ground_distance = adjusted_height * tan(total_angle)
        return ground_distance

    def calculate_object_position(self, bbox, object_real_height, drone_state):
        """Calculate object's GPS position using drone state and detection."""
        # Validation checks...
        
        center_x = bbox[0] + bbox[2]/2
        center_y = bbox[1] + bbox[3]/2
        
        horizontal_angle, vertical_angle = self.pixel_to_angle(center_x, center_y)
        corrected_horizontal = horizontal_angle * cos(drone_state['roll'])
        corrected_vertical = vertical_angle + horizontal_angle * sin(drone_state['roll'])

        ground_distance = self.get_distance(bbox[3], object_real_height)

        print("ground_distance: ", ground_distance)
        # Transform relative to drone heading
        dx = ground_distance * sin(corrected_horizontal + drone_state['yaw'])
        dy = ground_distance * cos(corrected_horizontal + drone_state['yaw'])
        
        drone_state["gps_lat"], drone_state["gps_lon"] = self.gps_to_local([drone_state["gps_lat"], drone_state["gps_lon"]])
        
        dx += drone_state["gps_lon"] 
        dy += drone_state["gps_lat"]

        # Use drone's current GPS as origin
        return self.local_to_gps(dx, dy)

    def local_to_gps(self, x_meters, y_meters) -> tuple:
        """Convert local cartesian coordinates to GPS coordinates."""
        METERS_PER_DEGREE = 111319.9
        
        dlat = y_meters / METERS_PER_DEGREE
        dlon = x_meters / (METERS_PER_DEGREE * cos(radians(self.origin_lat)))
        
        lat = self.origin_lat + dlat
        lon = self.origin_lon + dlon
        
        return lat, lon
    
    def gps_to_local(self, gps_coord: list) -> tuple:
        origin_lat = 19.0
        origin_lon = 72.0
        constant = 111319.9

        x = (gps_coord[0] - origin_lat) * constant
        y = (gps_coord[1] - origin_lon) * constant * cos(radians(origin_lat))
        
        return x, y