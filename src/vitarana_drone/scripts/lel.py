import math

class CameraDistanceCalculator:
    def __init__(self, camera_width, camera_height, horizontal_fov):
        """
        Initialize calculator with camera parameters
        
        Args:
            camera_width (int): Camera sensor width in pixels
            camera_height (int): Camera sensor height in pixels  
            horizontal_fov (float): Horizontal field of view in degrees
        """
        self.camera_width = camera_width
        self.camera_height = camera_height
        self.horizontal_fov = horizontal_fov
        self.focal_length = self._calculate_focal_length()
        
    def _calculate_focal_length(self):
        """Calculate focal length in pixels based on camera parameters"""
        return (self.camera_width / 2) / math.tan(math.radians(self.horizontal_fov / 2))
    
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

# Example usage
if __name__ == "__main__":
    # Camera parameters
    CAMERA_WIDTH = 320  # pixels
    CAMERA_HEIGHT = 256  # pixels
    HORIZONTAL_FOV = 80  # degrees
    
    # Object parameters
    OBJECT_PIXEL_HEIGHT = 20  # pixels
    OBJECT_REAL_HEIGHT = 2.0  # meters (e.g., human height)
    
    # Calculate distance
    calculator = CameraDistanceCalculator(CAMERA_WIDTH, CAMERA_HEIGHT, HORIZONTAL_FOV)
    distance = calculator.get_distance(OBJECT_PIXEL_HEIGHT, OBJECT_REAL_HEIGHT)
    
    print(f"Distance to object: {distance:.2f} meters")