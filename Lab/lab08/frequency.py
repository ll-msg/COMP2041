#!/usr/bin/python3
import sys, re, os

pattern = re.compile(r"\b" + sys.argv[1] + r"\b")

for lyric in sorted(os.listdir("lyrics")):
    num = 0
    count_line = 0
    artist = lyric.replace(".txt", "")
    artist = artist.replace("_", " ")
    file = os.path.join("lyrics", lyric)
    with open(file, "r") as lyrics:
        for content in lyrics:
            content = content.lower()
            lines = re.findall("[a-zA-Z]+", content)
            words = re.findall(pattern, content)
            num += len(words)
            count_line += len(lines)
        result = float(num) / float(count_line)
    print(f"{num:4}/{count_line:6} = {result:.9f} {artist}")