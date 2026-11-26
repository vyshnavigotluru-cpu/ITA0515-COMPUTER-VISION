import cv2
from google.colab import files
from IPython.display import Video, display

uploaded = files.upload()
filename = list(uploaded.keys())[0]

cap = cv2.VideoCapture(filename)

width = int(cap.get(3))
height = int(cap.get(4))

frames = []

while True:
    ret, frame = cap.read()
    if not ret:
        break
    frames.append(frame)

cap.release()

frames.reverse()

out = cv2.VideoWriter(
    "reverse_slow.mp4",
    cv2.VideoWriter_fourcc(*'mp4v'),
    10,
    (width, height)
)

for frame in frames:
    out.write(frame)

out.release()

display(Video("reverse_slow.mp4", embed=True))
