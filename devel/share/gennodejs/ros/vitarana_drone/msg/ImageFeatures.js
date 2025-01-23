// Auto-generated. Do not edit!

// (in-package vitarana_drone.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ImageFeatures {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.height = null;
      this.width = null;
      this.fow = null;
      this.angle_roll = null;
      this.angle_pitch = null;
      this.angle_yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('fow')) {
        this.fow = initObj.fow
      }
      else {
        this.fow = 0.0;
      }
      if (initObj.hasOwnProperty('angle_roll')) {
        this.angle_roll = initObj.angle_roll
      }
      else {
        this.angle_roll = 0.0;
      }
      if (initObj.hasOwnProperty('angle_pitch')) {
        this.angle_pitch = initObj.angle_pitch
      }
      else {
        this.angle_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('angle_yaw')) {
        this.angle_yaw = initObj.angle_yaw
      }
      else {
        this.angle_yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImageFeatures
    // Serialize message field [height]
    bufferOffset = _serializer.float64(obj.height, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float64(obj.width, buffer, bufferOffset);
    // Serialize message field [fow]
    bufferOffset = _serializer.float64(obj.fow, buffer, bufferOffset);
    // Serialize message field [angle_roll]
    bufferOffset = _serializer.float64(obj.angle_roll, buffer, bufferOffset);
    // Serialize message field [angle_pitch]
    bufferOffset = _serializer.float64(obj.angle_pitch, buffer, bufferOffset);
    // Serialize message field [angle_yaw]
    bufferOffset = _serializer.float64(obj.angle_yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImageFeatures
    let len;
    let data = new ImageFeatures(null);
    // Deserialize message field [height]
    data.height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [fow]
    data.fow = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_roll]
    data.angle_roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_pitch]
    data.angle_pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_yaw]
    data.angle_yaw = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vitarana_drone/ImageFeatures';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a70c173d9bf19022bdce4bf7be3f64f1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 height
    float64 width
    
    float64 fow
    
    float64 angle_roll
    float64 angle_pitch
    float64 angle_yaw
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImageFeatures(null);
    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.fow !== undefined) {
      resolved.fow = msg.fow;
    }
    else {
      resolved.fow = 0.0
    }

    if (msg.angle_roll !== undefined) {
      resolved.angle_roll = msg.angle_roll;
    }
    else {
      resolved.angle_roll = 0.0
    }

    if (msg.angle_pitch !== undefined) {
      resolved.angle_pitch = msg.angle_pitch;
    }
    else {
      resolved.angle_pitch = 0.0
    }

    if (msg.angle_yaw !== undefined) {
      resolved.angle_yaw = msg.angle_yaw;
    }
    else {
      resolved.angle_yaw = 0.0
    }

    return resolved;
    }
};

module.exports = ImageFeatures;
