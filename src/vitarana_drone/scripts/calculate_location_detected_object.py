#!/usr/bin/env python3

import numpy as np
from math import tan, cos, sin, pi

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

    def calculate_ground_distance(self, vertical_angle, drone_height, drone_pitch):
        """
        Calculate the ground distance to the object using trigonometry.
        This is the horizontal distance from the drone's position to the object.
        """
        # Camera angle relative to ground plane
        camera_angle = pi/2 - drone_pitch
        
        # Total angle to target
        total_angle = camera_angle + vertical_angle
        
        # Calculate ground distance using tangent
        ground_distance = drone_height * tan(total_angle)
        
        return ground_distance

    def meters_to_gps(self, lat, lon, d_north, d_east):
        """
        Convert north/east offsets in meters to GPS coordinates.
        This is a simple approximation valid for relatively short distances.
        
        lat, lon: Starting position in degrees
        d_north, d_east: Offsets in meters
        Returns: new_lat, new_lon in degrees
        """
        # Convert lat/lon to radians for calculations
        lat_rad = np.radians(lat)
        
        # Calculate the length of a degree of latitude and longitude at this location
        # These formulas are approximations that work well for small distances
        meters_per_lat = 111132.92 - 559.82 * cos(2 * lat_rad) + 1.175 * cos(4 * lat_rad)
        meters_per_lon = 111412.84 * cos(lat_rad) - 93.5 * cos(3 * lat_rad)
        
        # Convert offsets to degrees
        d_lat = d_north / meters_per_lat
        d_lon = d_east / meters_per_lon
        
        # Calculate new position
        new_lat = lat + d_lat
        new_lon = lon + d_lon
        
        return new_lat, new_lon

    def calculate_object_position(self, bbox, object_real_height, drone_state):
        """
        Calculate object's GPS position using current drone state and detected object information.
        This function ties together all our calculations to determine where the object is located.
        """
        # Validate drone state parameters
        required_params = ['height', 'gps_lat', 'gps_lon', 'pitch', 'roll', 'yaw']
        if not all(param in drone_state for param in required_params):
            raise ValueError(f"Missing required drone state parameters. Required: {required_params}")
            
        if drone_state['height'] <= 0:
            raise ValueError("Drone height must be positive")

        # Calculate center of detected object
        center_x = bbox[0] + bbox[2]/2
        center_y = bbox[1] + bbox[3]/2
        
        # Convert pixel coordinates to angles
        horizontal_angle, vertical_angle = self.pixel_to_angle(center_x, center_y)
        
        # Calculate ground distance
        ground_distance = self.calculate_ground_distance(
            vertical_angle,
            drone_state['height'],
            drone_state['pitch']
        )
        
        # Convert to North-East coordinates relative to drone
        # These calculations account for the drone's orientation
        dx = ground_distance * sin(horizontal_angle)
        dy = ground_distance * cos(horizontal_angle)
        
        # Apply drone's yaw to get world-oriented coordinates
        north_offset = dy * cos(drone_state['yaw']) - dx * sin(drone_state['yaw'])
        east_offset = dy * sin(drone_state['yaw']) + dx * cos(drone_state['yaw'])
        
        # Convert offsets to GPS coordinates
        target_lat, target_lon = self.meters_to_gps(
            drone_state['gps_lat'],
            drone_state['gps_lon'],
            north_offset,
            east_offset
        )
        
        return target_lat, target_lon

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