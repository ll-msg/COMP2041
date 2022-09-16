#!/usr/bin/python3
import re
import sys
import urllib.request
import bs4 as BeautifulSoup

IGNORE_WEBPAGE_ELEMENTS = set("[document] head meta style script title".split())

for url in sys.argv[1:]:
    response = urllib.request.urlopen(url)
    webpage = response.read().decode()
    soup = BeautifulSoup.BeautifulSoup(webpage, "lxml")
    for element in soup.findAll(text=True):
        parent = element.parent.name.lower()
        if parent in IGNORE_WEBPAGE_ELEMENTS:
            continue
        text = element.getText()
        # remove empty lines and leading whitespace
        text = re.sub(r"\n\s+", "\n", element)
        text = text.strip()
        if text:
            print(text)