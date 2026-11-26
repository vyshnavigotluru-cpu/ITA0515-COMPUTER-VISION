import cv2
import matplotlib.pyplot as plt
from google.colab import files

uploaded = files.upload()
filename = list(uploaded.keys())[0]

img = cv2.imread(filename)

text = input("Enter the text: ")

cv2.putText(img, text, (50, 100),
            cv2.FONT_HERSHEY_SIMPLEX,
            1, (0, 0, 255), 2)

plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title("Text on Image")
plt.axis("off")
plt.show()
