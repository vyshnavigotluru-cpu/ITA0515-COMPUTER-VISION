import cv2
from google.colab import files
from IPython.display import display, Video

# Upload video
uploaded = files.upload()

filename = list(uploaded.keys())[0]

# Read video
cap = cv2.VideoCapture(filename)

frames = []

while True:
    ret, frame = cap.read()

    if not ret:
        break

    frames.append(frame)

cap.release()

# Get video size
height, width = frames[0].shape[:2]

# Function to save video
def save_video(name, frames, fps):
    out = cv2.VideoWriter(
        name,
        cv2.VideoWriter_fourcc(*'mp4v'),
        fps,
        (width, height)
    )

    for frame in frames:
        out.write(frame)

    out.release()

# Slow motion video
save_video("slow.mp4", frames, 10)

# Fast motion video
save_video("fast.mp4", frames[::2], 20)

# Display videos
print("Slow Motion Video:")
display(Video("slow.mp4"))

print("Fast Motion Video:")
display(Video("fast.mp4"))
