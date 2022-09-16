#!/usr/bin/env python3
import csv
import sys,re

data = csv.reader(sys.stdin, delimiter='|')
output = []
for course, zID, name, program, gender in csv.reader(sys.stdin, delimiter='|'):
    if gender == "M":
        name = re.match("(.*), ", name)
        if name.group(1) not in output:
            output.append(name.group(1))

for student_name in sorted(output):
    print(student_name)