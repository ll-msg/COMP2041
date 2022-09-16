#!/usr/bin/env python3

import re, sys
orca = 0

for fileName in sys.argv:
    if (fileName != "./orca.py"):
        with open(fileName, "r") as f:
            for lines in f:
                columns = lines.split()
                if columns[2] == "Orca":
                    orca += int(columns[1])

print(str(orca) + " Orcas reported")


        