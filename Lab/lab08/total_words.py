#!/usr/bin/python3
import sys, re

num = 0
for content in sys.stdin:
    lines = re.findall("[a-zA-Z]+", content)
    num += len(lines)

print (str(num) + " words")