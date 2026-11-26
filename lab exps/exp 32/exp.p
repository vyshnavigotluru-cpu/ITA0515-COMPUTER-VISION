import cv2
import numpy as np
import matplotlib.pyplot as plt

img = np.ones((400, 400, 3), dtype=np.uint8) * 255

h, w = img.shape[:2]

bh = h // 10
bw = w // 10

cv2.rectangle(img, (0, 0), (bw, bh), (0, 0, 0), -1)
cv2.rectangle(img, (w-bw, 0), (w, bh), (255, 0, 0), -1)
cv2.rectangle(img, (0, h-bh), (bw, h), (0, 255, 0), -1)
cv2.rectangle(img, (w-bw, h-bh), (w, h), (0, 0, 255), -1)

plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title("Colored Boxes")
plt.axis("off")
plt.show()
