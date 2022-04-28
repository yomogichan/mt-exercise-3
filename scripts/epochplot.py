import matplotlib.pyplot as plt
import numpy as np
import sys


infile = sys.argv[1]
# infile = "evaluation_output_training_validation_testing.txt"

epochdictv = {}
epochdictt = {}
epochlist = []

with open(infile,'r',encoding="utf8") as f:
    for line in f:
        if "end" in line:
            epochdictv[line[16:19].strip()] = line[-7:-1].strip()
        elif "lr" in line:
            epochdictt[line[9:12].strip()] = line[-7:-1].strip()
print(epochdictv)


plt.style.use('_mpl-gallery')
plt_1 = plt.figure(figsize=(6, 6))
# make data
x1 = []
y1 = []
x2 = []
y2 = []


for k,v in epochdictv.items():
    x1.append(float(k))
    y1.append(float(v))

for k,v in epochdictt.items():
    x2.append(float(k))
    y2.append(float(v))

x1 = np.array(x1)
y1 = np.array(y1)
x2 = np.array(x2)
y2 = np.array(y2)

# plot
plt.plot(x1, y1, label= "validation",linewidth=2.0)
plt.plot(x2, y2, label= "training",linewidth=2.0)
plt.xlabel("Epoch")
plt.ylabel("ppl")
plt.title(infile.strip(".txt"))
plt.grid(True)
plt.tight_layout()

plt.legend()
plt.savefig(fname= infile.strip(".txt")+ ".jpg",format="jpg")
plt.show()


