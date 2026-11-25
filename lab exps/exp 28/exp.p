!pip install ultralytics -q

import cv2
from ultralytics import YOLO
from google.colab import files
from IPython.display import Video, display

uploaded = files.upload()
filename = list(uploaded.keys())[0]

model = YOLO("yolov8n.pt")

cap = cv2.VideoCapture(filename)

fps = cap.get(cv2.CAP_PROP_FPS)
width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

if fps <= 0:
    fps = 20

out = cv2.VideoWriter(
    "vehicle_output.mp4",
    cv2.VideoWriter_fourcc(*'mp4v'),
    fps,
    (width, height)
)

vehicles = ["car", "motorcycle", "bus", "truck"]

while True:
    ret, frame = cap.read()

    if not ret:
        break

    results = model(frame, verbose=False)

    for result in results:
        for box in result.boxes:
            class_id = int(box.cls[0])
            name = model.names[class_id]

            if name in vehicles:
                x1, y1, x2, y2 = map(int, box.xyxy[0])

                cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 2)
                cv2.putText(frame, name, (x1, y1-10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.7,
                            (0, 255, 0), 2)

    out.write(frame)

cap.release()
out.release()

print("Vehicle Detection Completed")

display(Video("vehicle_output.mp4", embed=True))
