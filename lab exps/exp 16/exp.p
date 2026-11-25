import cv2
import numpy as np
import matplotlib.pyplot as plt
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
img = cv2.imread(list(uploaded.keys())[0], 0)

# Apply Sobel operator
sobelx = cv2.Sobel(img, cv2.CV_64F, 1, 0, ksize=3)
sobely = cv2.Sobel(img, cv2.CV_64F, 0, 1, ksize=3)

# Combine edges
result = cv2.magnitude(sobelx, sobely)
result = cv2.convertScaleAbs(result)

# Display images
plt.figure(figsize=(10,5))

plt.subplot(1,2,1)
plt.imshow(img, cmap='gray')
plt.title("Original Image")
plt.axis("off")

plt.subplot(1,2,2)
plt.imshow(result, cmap='gray')
plt.title("Sobel Edge Detection")
plt.axis("off")

plt.show()
