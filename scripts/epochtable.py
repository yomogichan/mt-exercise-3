import pandas as pd
import sys


infile = sys.argv[1]
# infile = "Dropout0.txt"

epochdictv = {}
epochdictt = {}
epochlist = []

with open(infile,'r',encoding="utf8") as f:
    for line in f:
        if "end" in line:
            epochdictv[line[16:19].strip()] = line[-7:-1].strip()
        elif "lr" in line:
            epochdictt[line[9:12].strip()] = line[-7:-1].strip()


dft = pd.DataFrame(epochdictt.items(), columns=['Epoch', 'ppl'])
dfv = pd.DataFrame(epochdictv.items(), columns=['Epoch', 'ppl'])

dft.to_csv(infile.strip("txt") + "training.csv", sep='\t', encoding='utf-8')
dfv.to_csv(infile.strip("txt") + "validation.csv", sep='\t', encoding='utf-8')