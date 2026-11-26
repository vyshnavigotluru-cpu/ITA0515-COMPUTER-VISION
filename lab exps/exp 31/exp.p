import cv2
import matplotlib.pyplot as plt
from google.colab import files

uploaded = files.upload()
filename = list(uploaded.keys())[0]

img = cv2.imread(filename, 0)

ret, thresh = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY)

plt.figure(figsize=(10, 4))

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(img, cmap="gray")
plt.axis("off")

plt.subplot(1, 2, 2)
plt.title("Threshold Image")
plt.imshow(thresh, cmap="gray")
plt.axis("off")

plt.show()
