"""import os 
import cv2
import threading
import matplotlib.pyplot as plt

from ultralytics import YOLO
import pandas as pd 

from math import sqrt
from queue_class import lineQueue

def _pass():
    pass

def _get_video_features(cap) -> tuple:
    width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    fps = int(cap.get(cv2.CAP_PROP_FPS))
    return fps, (width, height)

def _save_video(save_folder, video_name, video_cap):
    fps, video_features = _get_video_features(video_cap)
    
    output_video_path = os.path.join(save_folder, (video_name + ".mp4"))
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
    out = cv2.VideoWriter(output_video_path, fourcc, fps, video_features)
    
def _get_velocity(fps, current_tracked_object):
    current_point = current_tracked_object.get(current_tracked_object._len_() - 1)
    second_point = current_tracked_object.get(current_tracked_object._len_() - fps - 1)

    substitution = (current_point[0] - second_point[0])*2 + (current_point[1] - second_point[1])*2
    px_div_sec = sqrt(substitution)
    return px_div_sec

def _get_box_features(box_object):
    xyxy = box_object.xyxy[0].cpu().numpy().astype(int)
    x1, y1, x2, y2 = xyxy
    obj_id = box_object.id[0].cpu().numpy().astype(int) if box_object.id is not None else None
    obj_cls = box_object.cls[0].cpu().numpy().astype(int)
    conf = box_object.conf.item()
    
    return (x1, y1, x2, y2), obj_id, obj_cls, conf

def _get_box_center(box: tuple) -> tuple:
    x1, y1, x2, y2 = box
    x_center = int((x1+x2) / 2)
    y_center = int((y1+y2) / 2)
    
    return (x_center, y_center)

def _get_track_points(current_tracked_object, point):
    start_point = current_tracked_object.get(point)
    end_point = current_tracked_object.get(point + 1) if current_tracked_object._len_() > 1 else _pass()
    return start_point,end_point

def tracker(video_path: str, model_path: str, save_location: str):
    obj_dict = {}
    queue_size = 180
    cap = cv2.VideoCapture(video_path)
    fps, _ = _get_video_features(cap)
    __model = YOLO(model_path)
    
    while cap.isOpened():
        ret, frame = cap.read()
        if not ret: break
        
        track_result = __model.track(frame, persist = True)
        
        for box in track_result[0].boxes:
            box_corners, obj_id, obj_cls, conf = _get_box_features(box)
            x_center, y_center = _get_box_center(box_corners)

        if obj_id == None: continue

        current_object = obj_dict.get(int(obj_id))
        
        obj_dict[int(obj_id)] = lineQueue(queue_size) if current_object == None else _
        
        current_tracked_object = obj_dict.get(int(obj_id))
        current_tracked_object.enqueue((x_center, y_center))
        
        for point in range(obj_dict.get(int(obj_id))._len_() - 1):
            start_point, end_point = _get_track_points(current_tracked_object, point)
            
            cv2.line(frame, start_point, end_point, (0,255,0), 4)
            
        px_div_sec = get_velocity(queue_size, fps, current_tracked_object) if current_tracked_object.len_() >= fps else 0.0
        cv2.putText(frame, f'px/sec: {px_div_sec:.2f}', (box_corners[2], box_corners[3]-20), cv2.FONT_HERSHEY_SIMPLEX, 0.4, (0, 255, 0), 1)
        cv2.imshow("object tracker",frame)
        
    cap.release()
    cv2.destroyAllWindows()"""

from ultralytics import YOLO

model = YOLO(r'src/vitarana_drone/ai_models/last.pt') # Load the model

print(model) # Print the model