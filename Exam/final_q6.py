#!/usr/bin/python3
import sys

file1 = sys.argv[1]
file2 = sys.argv[2]
lst1 = []
save_lst1 = []
lst2 = []

with open (file1, "r") as f1:
    lst1 = f1.readlines()
    for ele in lst1:
        save_lst1.append(ele)
    lst1.reverse()

with open (file2, "r") as f2:
    lst2 = f2.readlines()

if lst2 == lst1:
    print("Mirrored")
elif len(lst2) != len(lst1):
    print("Not mirrored: different number of lines: " + str(len(lst1)) + " versus " + str(len(lst2)))
else: #FIXME
    for ele1, ele2 in zip(lst1, lst2):
        if ele1 != ele2:
            num = save_lst1.index(ele1) + 1
            print("Not mirrored: line " + str(num) + " different")
            break