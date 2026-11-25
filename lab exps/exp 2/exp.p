import cv2
import matplotlib.pyplot as plt
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
filename = list(uploaded.keys())[0]
img = cv2.imread(filename)

# Check image
if img is None:
    print("Image not found")
else:
    # Convert BGR to RGB
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

    # Apply Gaussian Blur
    blur = cv2.GaussianBlur(img, (5, 5), 0)

    # Display images
    plt.figure(figsize=(10, 5))

    plt.subplot(1, 2, 1)
    plt.imshow(img)
    plt.title("Original Image")
    plt.axis("off")

    plt.subplot(1, 2, 2)
    plt.imshow(blur)
    plt.title("Gaussian Blur")
    plt.axis("off")

    plt.show()
