#!/usr/bin/python3
import subprocess, sys, re

url = "http://www.timetable.unsw.edu.au/2022/" + sys.argv[1] + "KENS.html"

command = "curl --location --silent " + url + " | cut -d '<' -f3 | grep -E " + sys.argv[1] + " | sed 's/.*>//'"

with open("save.txt", "w") as output:
    p = subprocess.call(command, shell=True, stdout=output)

name = []
full_name = []
with open("save.txt", "r") as f:
    for lines in f:
        if re.search("%s[0-9].*" % sys.argv[1], lines) != None:
            name.append(lines.strip())
        else:
            full_name.append(lines.strip())

with open("save1.txt", "w") as f1:
    for n, f in zip(name, full_name):
        f1.write(n + " " + f)
        f1.write("\n")

with open("save1.txt", "r") as f2:
    lines = f2.readlines()
    lines = sorted(set(lines))
    for ele in lines:
        print (ele.strip())
    




