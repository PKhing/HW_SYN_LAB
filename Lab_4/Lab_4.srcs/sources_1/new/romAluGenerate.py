bcdto7 = {
    '0': "1000000",
    '1': "1111001",
    "2": "0100100",
    "3": "0110000",
    "4": "0011001",
    "5": "0010010",
    "6": "0000010",
    "7": "1111000",
    "8": "0000000",
    "9": "0010000",
    "-": "0111111"}
def bcdTo7Seg(bcd):
  seg = ""
  s = str(bcd)
  for i in s:
    seg += bcdto7[i]
  return "1" * (28 - len(seg)) + seg


e = "1" * 21 + "0000110"

f = open("romAlu.data", "w+")

for i in range(16):
  for j in range(16):
    f.write(bcdTo7Seg(i + j) + " // {} + {}\n".format(i, j))

for i in range(16):
  for j in range(16):
    f.write(bcdTo7Seg(i - j) + " // {} - {}\n".format(i, j))


for i in range(16):
  for j in range(16):
    f.write(bcdTo7Seg(i * j) + " // {} * {}\n".format(i, j))


for i in range(16):
  for j in range(16):
    f.write((bcdTo7Seg(i // j) if j > 0 else e) + " // {} / {}\n".format(i, j))
