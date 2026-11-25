import cv2
import matplotlib.pyplot as plt
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
img = cv2.imread(list(uploaded.keys())[0])

# Create watermark
watermark = img.copy()

cv2.putText(watermark, "MY IMAGE",
            (50, 80),
            cv2.FONT_HERSHEY_SIMPLEX,
            1, (0, 0, 255), 2)

# Display images
plt.figure(figsize=(10,5))

plt.subplot(1,2,1)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title("Original Image")
plt.axis("off")

plt.subplot(1,2,2)
plt.imshow(cv2.cvtColor(watermark, cv2.COLOR_BGR2RGB))
plt.title("Watermarked Image")
plt.axis("off")

plt.show()
