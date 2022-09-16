#!/usr/bin/python3
import re, sys

num = 0
pattern = re.compile(r"\b" + sys.argv[1] + r"\b")

for content in sys.stdin:
    content = content.lower()
    words = re.findall(pattern, content)
    num += len(words)

print (sys.argv[1] + " occurred " + str(num) + " times")