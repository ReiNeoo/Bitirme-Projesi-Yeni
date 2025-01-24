; Auto-generated. Do not edit!


(cl:in-package vitarana_drone-msg)


;//! \htmlinclude TargetGpsPosition.msg.html

(cl:defclass <TargetGpsPosition> (roslisp-msg-protocol:ros-message)
  ((longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0))
)

(cl:defclass TargetGpsPosition (<TargetGpsPosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TargetGpsPosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TargetGpsPosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vitarana_drone-msg:<TargetGpsPosition> is deprecated: use vitarana_drone-msg:TargetGpsPosition instead.")))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <TargetGpsPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vitarana_drone-msg:longitude-val is deprecated.  Use vitarana_drone-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <TargetGpsPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vitarana_drone-msg:latitude-val is deprecated.  Use vitarana_drone-msg:latitude instead.")
  (latitude m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TargetGpsPosition>) ostream)
  "Serializes a message object of type '<TargetGpsPosition>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TargetGpsPosition>) istream)
  "Deserializes a message object of type '<TargetGpsPosition>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TargetGpsPosition>)))
  "Returns string type for a message object of type '<TargetGpsPosition>"
  "vitarana_drone/TargetGpsPosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TargetGpsPosition)))
  "Returns string type for a message object of type 'TargetGpsPosition"
  "vitarana_drone/TargetGpsPosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TargetGpsPosition>)))
  "Returns md5sum for a message object of type '<TargetGpsPosition>"
  "826f8fcadfa8742a6495798d3978624a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TargetGpsPosition)))
  "Returns md5sum for a message object of type 'TargetGpsPosition"
  "826f8fcadfa8742a6495798d3978624a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TargetGpsPosition>)))
  "Returns full string definition for message of type '<TargetGpsPosition>"
  (cl:format cl:nil "float32 longitude~%float32 latitude~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TargetGpsPosition)))
  "Returns full string definition for message of type 'TargetGpsPosition"
  (cl:format cl:nil "float32 longitude~%float32 latitude~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TargetGpsPosition>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TargetGpsPosition>))
  "Converts a ROS message object to a list"
  (cl:list 'TargetGpsPosition
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':latitude (latitude msg))
))
