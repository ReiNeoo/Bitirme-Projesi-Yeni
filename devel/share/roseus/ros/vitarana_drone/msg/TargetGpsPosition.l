;; Auto-generated. Do not edit!


(when (boundp 'vitarana_drone::TargetGpsPosition)
  (if (not (find-package "VITARANA_DRONE"))
    (make-package "VITARANA_DRONE"))
  (shadow 'TargetGpsPosition (find-package "VITARANA_DRONE")))
(unless (find-package "VITARANA_DRONE::TARGETGPSPOSITION")
  (make-package "VITARANA_DRONE::TARGETGPSPOSITION"))

(in-package "ROS")
;;//! \htmlinclude TargetGpsPosition.msg.html


(defclass vitarana_drone::TargetGpsPosition
  :super ros::object
  :slots (_longitude _latitude ))

(defmethod vitarana_drone::TargetGpsPosition
  (:init
   (&key
    ((:longitude __longitude) 0.0)
    ((:latitude __latitude) 0.0)
    )
   (send-super :init)
   (setq _longitude (float __longitude))
   (setq _latitude (float __latitude))
   self)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:serialization-length
   ()
   (+
    ;; float32 _longitude
    4
    ;; float32 _latitude
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _longitude
     (setq _longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _latitude
     (setq _latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vitarana_drone::TargetGpsPosition :md5sum-) "826f8fcadfa8742a6495798d3978624a")
(setf (get vitarana_drone::TargetGpsPosition :datatype-) "vitarana_drone/TargetGpsPosition")
(setf (get vitarana_drone::TargetGpsPosition :definition-)
      "float32 longitude
float32 latitude
")



(provide :vitarana_drone/TargetGpsPosition "826f8fcadfa8742a6495798d3978624a")


