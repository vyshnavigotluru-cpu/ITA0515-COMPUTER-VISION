import cv2
from google.colab import files
from IPython.display import Video, display

uploaded = files.upload()
filename = next(iter(uploaded))

cap = cv2.VideoCapture(filename)

fps = cap.get(cv2.CAP_PROP_FPS)
width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

frames = []

while True:
    ret, frame = cap.read()
    if not ret:
        break
    frames.append(frame)

cap.release()

frames.reverse()

out = cv2.VideoWriter(
    "reverse_video.mp4",
    cv2.VideoWriter_fourcc(*'mp4v'),
    fps,
    (width, height)
)

for frame in frames:
    out.write(frame)

out.release()

display(Video("reverse_video.mp4", embed=True))
