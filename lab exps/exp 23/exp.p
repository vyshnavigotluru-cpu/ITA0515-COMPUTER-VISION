import cv2
import numpy as np
import matplotlib.pyplot as plt
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
img = cv2.imread(list(uploaded.keys())[0], 0)

# Create kernel
kernel = np.ones((5,5), np.uint8)

# Apply Top Hat
result = cv2.morphologyEx(
    img, cv2.MORPH_TOPHAT, kernel
)

# Display images
plt.figure(figsize=(10,5))

plt.subplot(1,2,1)
plt.imshow(img, cmap='gray')
plt.title("Original Image")
plt.axis("off")

plt.subplot(1,2,2)
plt.imshow(result, cmap='gray')
plt.title("Top Hat Image")
plt.axis("off")

plt.show()
