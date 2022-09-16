#!/usr/bin/env python3
import re, sys

pod = 0
num = 0
fileName = sys.argv[1]

with open("save_whale.txt", "w") as save_whale:
    for fileName in sys.argv:
        if (fileName != "./whale_summary.py"):
            with open(fileName, "r") as whale:
                for ori_whales in whale:
                    ori_whales = re.sub(r"\s+", " ", ori_whales)
                    ori_whales = ori_whales.lower()
                    ori_whales = ori_whales.rstrip("s ")
                    ori_whales = ori_whales.split()[2:]
                    save_whales = "\t".join(ori_whales) + "\n"
                    save_whale.write(re.sub(r"\s+", " ", save_whales) + "\n")

with open("save_whale.txt", "r") as whale_names:
    name_set = sorted(set(whale_names.readlines()))

with open("save_whale.txt", "w") as names:
    names.writelines(name_set)

with open("save_whale.txt", "r") as whale_names:
    for whales in whale_names:
        whales = whales.strip("\n")
        for fileName in sys.argv:
            if (fileName != "./whale_summary.py"):
                with open(fileName, "r") as whale:
                    for orig_whales in whale:
                        whale_num = orig_whales.split()[1]
                        orig_whales = re.sub(r"\s+", " ", "\t".join(orig_whales.split()[2:])).lower().rstrip("s ")
                        if orig_whales == whales.rstrip(" "):
                            pod += 1
                            num += int(whale_num)
        print(whales + "observations: " + str(pod) + " pods, " + str(num) + " individuals")
        pod = 0
        num = 0
