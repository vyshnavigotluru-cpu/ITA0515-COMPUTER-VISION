import cv2
import matplotlib.pyplot as plt
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
filename = list(uploaded.keys())[0]
img = cv2.imread(filename)

# Resize image to bigger size
bigger = cv2.resize(img, None, fx=2, fy=2)

# Resize image to smaller size
smaller = cv2.resize(img, None, fx=0.5, fy=0.5)

# Display images
plt.figure(figsize=(12,5))

plt.subplot(1,3,1)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title("Original Image")
plt.axis("off")

plt.subplot(1,3,2)
plt.imshow(cv2.cvtColor(bigger, cv2.COLOR_BGR2RGB))
plt.title("Bigger Image")
plt.axis("off")

plt.subplot(1,3,3)
plt.imshow(cv2.cvtColor(smaller, cv2.COLOR_BGR2RGB))
plt.title("Smaller Image")
plt.axis("off")

plt.show()
