#!/usr/bin/env python3
import sys

num = sys.argv[1]
file = sys.argv[2]

with open(file, "r") as f:
    for lines in f:
        if len(lines) < int(num):
            continue
        if ' ' not in lines:
            continue 
        