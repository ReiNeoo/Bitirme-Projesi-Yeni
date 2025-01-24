
(cl:in-package :asdf)

(defsystem "vitarana_drone-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DetectionFeatures" :depends-on ("_package_DetectionFeatures"))
    (:file "_package_DetectionFeatures" :depends-on ("_package"))
    (:file "ImageFeatures" :depends-on ("_package_ImageFeatures"))
    (:file "_package_ImageFeatures" :depends-on ("_package"))
    (:file "TargetGpsPosition" :depends-on ("_package_TargetGpsPosition"))
    (:file "_package_TargetGpsPosition" :depends-on ("_package"))
    (:file "TargetPosition" :depends-on ("_package_TargetPosition"))
    (:file "_package_TargetPosition" :depends-on ("_package"))
    (:file "edrone_cmd" :depends-on ("_package_edrone_cmd"))
    (:file "_package_edrone_cmd" :depends-on ("_package"))
    (:file "prop_speed" :depends-on ("_package_prop_speed"))
    (:file "_package_prop_speed" :depends-on ("_package"))
  ))