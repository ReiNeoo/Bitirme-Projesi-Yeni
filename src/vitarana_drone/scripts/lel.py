import tf.transformations

quaternion = [0.7071, 0, 0.7071, 0]  # [x, y, z, w]
euler_angles = tf.transformations.euler_from_quaternion(quaternion)

print("Euler angles (radians):", euler_angles)