import cv2

def format(x):
  return bin(x)[2:][:-4].zfill(4)


img = cv2.imread('TermProject/TermProject.srcs/sources_1/new/rom/number.png')
f = open("TermProject/TermProject.srcs/sources_1/new/rom/numberRgb.mem", "w")


for i in range(0, img.shape[0], 2):
  for k in range(3):
    for j in range(0, img.shape[1], 2):
      [b, g, r] = img[i, j]
      f.write(format(r) + format(g) + format(b) + "\n")
      f.write(format(r) + format(g) + format(b) + "\n")
      f.write(format(r) + format(g) + format(b) + "\n")
