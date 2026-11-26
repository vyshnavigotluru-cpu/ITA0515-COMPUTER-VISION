import cv2
import numpy as np
import matplotlib.pyplot as plt
from google.colab import files

uploaded = files.upload()
filename = list(uploaded.keys())[0]

img = cv2.imread(filename)

hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

lower = np.array([0, 0, 0])
upper = np.array([180, 255, 100])

mask = cv2.inRange(hsv, lower, upper)

background = cv2.bitwise_and(img, img, mask=mask)

plt.figure(figsize=(10, 4))

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.axis("off")

plt.subplot(1, 2, 2)
plt.title("Background")
plt.imshow(cv2.cvtColor(background, cv2.COLOR_BGR2RGB))
plt.axis("off")

plt.show()
