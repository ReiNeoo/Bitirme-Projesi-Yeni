;; Auto-generated. Do not edit!


(when (boundp 'vitarana_drone::image_features)
  (if (not (find-package "VITARANA_DRONE"))
    (make-package "VITARANA_DRONE"))
  (shadow 'image_features (find-package "VITARANA_DRONE")))
(unless (find-package "VITARANA_DRONE::IMAGE_FEATURES")
  (make-package "VITARANA_DRONE::IMAGE_FEATURES"))

(in-package "ROS")
;;//! \htmlinclude image_features.msg.html


(defclass vitarana_drone::image_features
  :super ros::object
  :slots (_height _width _fow _angle_roll _angle_pitch _angle_yaw ))

(defmethod vitarana_drone::image_features
  (:init
   (&key
    ((:height __height) 0.0)
    ((:width __width) 0.0)
    ((:fow __fow) 0.0)
    ((:angle_roll __angle_roll) 0.0)
    ((:angle_pitch __angle_pitch) 0.0)
    ((:angle_yaw __angle_yaw) 0.0)
    )
   (send-super :init)
   (setq _height (float __height))
   (setq _width (float __width))
   (setq _fow (float __fow))
   (setq _angle_roll (float __angle_roll))
   (setq _angle_pitch (float __angle_pitch))
   (setq _angle_yaw (float __angle_yaw))
   self)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:fow
   (&optional __fow)
   (if __fow (setq _fow __fow)) _fow)
  (:angle_roll
   (&optional __angle_roll)
   (if __angle_roll (setq _angle_roll __angle_roll)) _angle_roll)
  (:angle_pitch
   (&optional __angle_pitch)
   (if __angle_pitch (setq _angle_pitch __angle_pitch)) _angle_pitch)
  (:angle_yaw
   (&optional __angle_yaw)
   (if __angle_yaw (setq _angle_yaw __angle_yaw)) _angle_yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _height
    8
    ;; float64 _width
    8
    ;; float64 _fow
    8
    ;; float64 _angle_roll
    8
    ;; float64 _angle_pitch
    8
    ;; float64 _angle_yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _fow
       (sys::poke _fow (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle_roll
       (sys::poke _angle_roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle_pitch
       (sys::poke _angle_pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle_yaw
       (sys::poke _angle_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _fow
     (setq _fow (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle_roll
     (setq _angle_roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle_pitch
     (setq _angle_pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle_yaw
     (setq _angle_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get vitarana_drone::image_features :md5sum-) "a70c173d9bf19022bdce4bf7be3f64f1")
(setf (get vitarana_drone::image_features :datatype-) "vitarana_drone/image_features")
(setf (get vitarana_drone::image_features :definition-)
      "float64 height
float64 width

float64 fow

float64 angle_roll
float64 angle_pitch
float64 angle_yaw
")



(provide :vitarana_drone/image_features "a70c173d9bf19022bdce4bf7be3f64f1")


