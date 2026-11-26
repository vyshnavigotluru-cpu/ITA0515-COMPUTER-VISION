!pip install pytesseract -q
!apt-get install tesseract-ocr -y -qq

import cv2
import pytesseract
from google.colab import files

uploaded = files.upload()
filename = list(uploaded.keys())[0]

cap = cv2.VideoCapture(filename)

while True:
    ret, frame = cap.read()

    if not ret:
        break

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    text = pytesseract.image_to_string(gray)

    if text.strip():
        print("Extracted Text:")
        print(text)

cap.release()

print("Text Extraction Completed")
