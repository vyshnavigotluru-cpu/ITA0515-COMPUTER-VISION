import cv2
from google.colab.patches import cv2_imshow
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
img = cv2.imread(list(uploaded.keys())[0])

# Convert image to grayscale
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Display original image
print("Original Image:")
cv2_imshow(img)

# Display grayscale image
print("Grayscale Image:")
cv2_imshow(gray)
