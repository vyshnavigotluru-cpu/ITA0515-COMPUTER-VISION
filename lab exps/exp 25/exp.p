!pip install ultralytics

from ultralytics import YOLO
from google.colab import files
from PIL import Image

# Upload image
uploaded = files.upload()

filename = list(uploaded.keys())[0]

# Load YOLO model
model = YOLO("yolov8n.pt")

# Detect objects
results = model(filename)

# Display result
for r in results:
    print("Detected Objects:")

    for box in r.boxes:
        name = model.names[int(box.cls[0])]
        print(name)

    display(Image.fromarray(r.plot()[:, :, ::-1]))
