#!/bin/dash
url=$(echo "http://www.timetable.unsw.edu.au/current/"$1"KENS.html")
curl --location --silent $url | cut -d '<' -f3 | grep -E "$1" | sed 's/.*>//' | sed -z "s/\($1[0-9]\{4\}\)\n/\1 /g" | sort | uniq
