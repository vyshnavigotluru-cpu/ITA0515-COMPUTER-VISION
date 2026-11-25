import cv2
import matplotlib.pyplot as plt
from google.colab import files

# Upload image
uploaded = files.upload()

# Read image
filename = list(uploaded.keys())[0]
img = cv2.imread(filename)

# Function to analyze histogram
def analyze_histogram(img):

    colors = ('b', 'g', 'r')
    labels = ('Blue', 'Green', 'Red')

    for i, color in enumerate(colors):
        hist = cv2.calcHist([img], [i], None, [256], [0, 256])
        plt.plot(hist, color=color, label=labels[i])

    plt.title("Color Histogram")
    plt.xlabel("Pixel Intensity")
    plt.ylabel("Number of Pixels")
    plt.legend()
    plt.show()

# Display original image
print("Original Image:")
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.axis("off")
plt.show()

# Analyze histogram
analyze_histogram(img)
