#!/bin/dash

grep -e '|M$' | cut -d "|" -f3 | cut -d "," -f1 | tr -d ' ' | sort | uniq