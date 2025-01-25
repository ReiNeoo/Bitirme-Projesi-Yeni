#!/usr/bin/env python3

import numpy as np
from math import tan, cos, sin, pi, radians

class ObjectGPSLocator:
    def __init__(self, camera_params):
        """
        Initialize with static camera parameters
        
        camera_params: dict containing
            - horizontal_fov: Horizontal field of view in radians
            - sensor_width: Camera sensor width in pixels
            - sensor_height: Camera sensor height in pixels
        """
        self.camera_params = camera_params
        
        # The Earth's radius in meters - we'll need this for GPS calculations
        self.EARTH_RADIUS = 6371000  
        
        # Calculate vertical FOV using the sensor's aspect ratio
        aspect_ratio = camera_params[2] / camera_params[1]
        self.vertical_fov = camera_params[0] * aspect_ratio

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
            raise ValueError("Adjusted height must be positive")

        ground_distance = adjusted_height * tan(total_angle)
        return ground_distance

    def local_to_gps(self, x_meters, y_meters) -> tuple:
        """
        Convert local cartesian coordinates to GPS coordinates.
        x_meters: East-West distance (East positive)
        y_meters: North-South distance (North positive)
        """
        origin_lat = 19.0  # Change these to your reference point
        origin_lon = 72.0

        dlat = y_meters / 111319.9
        dlon = x_meters / (111319.9 * cos(radians(origin_lat)))

        lat = origin_lat + dlat
        lon = origin_lon + dlon

        return lat, lon

    def calculate_object_position(self, bbox, object_real_height, drone_state):
        """Calculate object's GPS position using drone state and detection."""
        required_params = ['height', 'gps_lat', 'gps_lon', 'pitch', 'roll', 'yaw']
        if not all(param in drone_state for param in required_params):
            raise ValueError(f"Missing required drone state parameters: {required_params}")

        if drone_state['height'] <= 0:
            raise ValueError("Drone height must be positive")

        # Get center of detected object
        center_x = bbox[0] + bbox[2] / 2
        center_y = bbox[1] + bbox[3] / 2

        # Get angles and apply roll correction
        horizontal_angle, vertical_angle = self.pixel_to_angle(center_x, center_y)
        corrected_horizontal = horizontal_angle * cos(drone_state['roll'])
        corrected_vertical = vertical_angle + horizontal_angle * sin(drone_state['roll'])

        # Calculate distance with object height
        ground_distance = self.calculate_ground_distance(
            corrected_vertical,
            drone_state['height'],
            drone_state['pitch'],
            object_real_height
        )

        # Convert to cartesian coordinates
        dx = ground_distance * sin(corrected_horizontal)
        dy = ground_distance * cos(corrected_horizontal)

        # Apply yaw rotation
        x_local = dy * sin(drone_state['yaw']) + dx * cos(drone_state['yaw'])
        y_local = dy * cos(drone_state['yaw']) - dx * sin(drone_state['yaw'])

        # Convert to GPS
        return self.local_to_gps(x_local, y_local)

# Example usage
if __name__ == "__main__":
    # Camera parameters (static)
    camera_params = {
        'horizontal_fov': pi/2,  # 90 degrees in radians
        'sensor_width': 1920,    # pixels
        'sensor_height': 1080    # pixels
    }
    
    # Create locator instance
    locator = ObjectGPSLocator(camera_params)
    
    # Example of processing a frame
    drone_state = {
        'height': 50.0,          # meters
        'gps_lat': 40.7128,      # degrees
        'gps_lon': -74.0060,     # degrees
        'pitch': -0.349066,      # radians
        'roll': 0.0,             # radians
        'yaw': 0.785398          # radians
    }
    
    # Example detection
    bbox = (960, 540, 100, 200)  # x, y, width, height in pixels
    object_height = 1.8          # meters (e.g., human height)
    
    # Calculate object position
    try:
        target_lat, target_lon = locator.calculate_object_position(
            bbox, 
            object_height,
            drone_state
        )
        print(f"Object GPS Location: {target_lat:.6f}, {target_lon:.6f}")
    except ValueError as e:
        print(f"Error: {e}")