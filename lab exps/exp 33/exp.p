import cv2
import numpy as np
import matplotlib.pyplot as plt

img = np.ones((400, 400, 3), dtype=np.uint8) * 255

cv2.rectangle(img, (100, 100), (300, 300), (0, 0, 255), 3)

plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title("Rectangle")
plt.axis("off")
plt.show()
