import cv2
import numpy as np
import matplotlib.pyplot as plt
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
filename = list(uploaded.keys())[0]
img = cv2.imread(filename)

rows, cols = img.shape[:2]

# Define three points
pts1 = np.float32([[50,50], [200,50], [50,200]])
pts2 = np.float32([[10,100], [200,50], [100,250]])

# Calculate affine transformation matrix
matrix = cv2.getAffineTransform(pts1, pts2)

# Apply transformation
result = cv2.warpAffine(img, matrix, (cols, rows))

# Display images
plt.figure(figsize=(10,5))

plt.subplot(1,2,1)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title("Original Image")
plt.axis("off")

plt.subplot(1,2,2)
plt.imshow(cv2.cvtColor(result, cv2.COLOR_BGR2RGB))
plt.title("Affine Transformation")
plt.axis("off")

plt.show()
