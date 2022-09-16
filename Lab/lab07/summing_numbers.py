#!/usr/bin/env python3

import sys, re
file = sys.argv[1]
num = 0
with open(file, "r") as f:
    content = f.read()
    pattern = re.compile(r'\d+')
    character = pattern.findall(content)
    for nums in character:
        num += int(nums)
print(num)

