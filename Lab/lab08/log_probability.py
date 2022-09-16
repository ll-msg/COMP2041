#!/usr/bin/python3
import sys, re, os, math

for lyric in sorted(os.listdir("lyrics")):
    final_result = 0
    num = 0
    count_line = 0
    lines = []
    artist = lyric.replace(".txt", "")
    artist = artist.replace("_", " ")
    file = os.path.join("lyrics", lyric)
    
    for log_words in sys.argv:
        #pattern = r"\b" + re.escape(log_words)+ r"\b"
        if (log_words != "./log_probability.py"):
            with open(file, "r") as lyrics:
                for content in lyrics:
                    content = content.lower()
                    lines = re.findall(r"[^a-zA-Z]", content)
                    words = re.findall(pattern, content)
                    num += len(words)
                    count_line += len(lines)
                result = math.log(float(num + 1) / float(count_line))
                final_result += result
    print(f"{final_result:10.5f} {artist}")