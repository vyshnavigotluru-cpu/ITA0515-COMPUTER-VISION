import cv2
import matplotlib.pyplot as plt
import numpy as np
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
filename = list(uploaded.keys())[0]
img = cv2.imread(filename, 0)

# Create kernel
kernel = np.ones((5,5), np.uint8)

# Apply dilation
dilated = cv2.dilate(img, kernel, iterations=1)

# Display images
plt.figure(figsize=(10,5))

plt.subplot(1,2,1)
plt.imshow(img, cmap='gray')
plt.title("Original Image")
plt.axis("off")

plt.subplot(1,2,2)
plt.imshow(dilated, cmap='gray')
plt.title("Dilated Image")
plt.axis("off")

plt.show()
