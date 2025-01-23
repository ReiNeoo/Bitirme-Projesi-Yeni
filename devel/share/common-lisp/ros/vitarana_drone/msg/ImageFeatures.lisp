; Auto-generated. Do not edit!


(cl:in-package vitarana_drone-msg)


;//! \htmlinclude ImageFeatures.msg.html

(cl:defclass <ImageFeatures> (roslisp-msg-protocol:ros-message)
  ((height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (fow
    :reader fow
    :initarg :fow
    :type cl:float
    :initform 0.0)
   (angle_roll
    :reader angle_roll
    :initarg :angle_roll
    :type cl:float
    :initform 0.0)
   (angle_pitch
    :reader angle_pitch
    :initarg :angle_pitch
    :type cl:float
    :initform 0.0)
   (angle_yaw
    :reader angle_yaw
    :initarg :angle_yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass ImageFeatures (<ImageFeatures>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImageFeatures>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImageFeatures)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vitarana_drone-msg:<ImageFeatures> is deprecated: use vitarana_drone-msg:ImageFeatures instead.")))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <ImageFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vitarana_drone-msg:height-val is deprecated.  Use vitarana_drone-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <ImageFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vitarana_drone-msg:width-val is deprecated.  Use vitarana_drone-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'fow-val :lambda-list '(m))
(cl:defmethod fow-val ((m <ImageFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vitarana_drone-msg:fow-val is deprecated.  Use vitarana_drone-msg:fow instead.")
  (fow m))

(cl:ensure-generic-function 'angle_roll-val :lambda-list '(m))
(cl:defmethod angle_roll-val ((m <ImageFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vitarana_drone-msg:angle_roll-val is deprecated.  Use vitarana_drone-msg:angle_roll instead.")
  (angle_roll m))

(cl:ensure-generic-function 'angle_pitch-val :lambda-list '(m))
(cl:defmethod angle_pitch-val ((m <ImageFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vitarana_drone-msg:angle_pitch-val is deprecated.  Use vitarana_drone-msg:angle_pitch instead.")
  (angle_pitch m))

(cl:ensure-generic-function 'angle_yaw-val :lambda-list '(m))
(cl:defmethod angle_yaw-val ((m <ImageFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vitarana_drone-msg:angle_yaw-val is deprecated.  Use vitarana_drone-msg:angle_yaw instead.")
  (angle_yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImageFeatures>) ostream)
  "Serializes a message object of type '<ImageFeatures>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'fow))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImageFeatures>) istream)
  "Deserializes a message object of type '<ImageFeatures>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fow) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_roll) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_pitch) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_yaw) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImageFeatures>)))
  "Returns string type for a message object of type '<ImageFeatures>"
  "vitarana_drone/ImageFeatures")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageFeatures)))
  "Returns string type for a message object of type 'ImageFeatures"
  "vitarana_drone/ImageFeatures")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImageFeatures>)))
  "Returns md5sum for a message object of type '<ImageFeatures>"
  "a70c173d9bf19022bdce4bf7be3f64f1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImageFeatures)))
  "Returns md5sum for a message object of type 'ImageFeatures"
  "a70c173d9bf19022bdce4bf7be3f64f1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImageFeatures>)))
  "Returns full string definition for message of type '<ImageFeatures>"
  (cl:format cl:nil "float64 height~%float64 width~%~%float64 fow~%~%float64 angle_roll~%float64 angle_pitch~%float64 angle_yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImageFeatures)))
  "Returns full string definition for message of type 'ImageFeatures"
  (cl:format cl:nil "float64 height~%float64 width~%~%float64 fow~%~%float64 angle_roll~%float64 angle_pitch~%float64 angle_yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImageFeatures>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImageFeatures>))
  "Converts a ROS message object to a list"
  (cl:list 'ImageFeatures
    (cl:cons ':height (height msg))
    (cl:cons ':width (width msg))
    (cl:cons ':fow (fow msg))
    (cl:cons ':angle_roll (angle_roll msg))
    (cl:cons ':angle_pitch (angle_pitch msg))
    (cl:cons ':angle_yaw (angle_yaw msg))
))
