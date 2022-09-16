#!/usr/bin/python3
import re
import sys
import requests
import bs4 as BeautifulSoup


url = "http://www.timetable.unsw.edu.au/2022/" + sys.argv[1] + "KENS.html"

response = requests.get(url)
soup = BeautifulSoup.BeautifulSoup(response.text, "html5lib")
full_name = []
for element in soup.findAll('a', {'href': re.compile(r'.*\.html')}):
    if re.match("New search by", element.text) != None:
        continue
    if re.match(sys.argv[1], element.text) != None:
        full_name.append(element.text)
    else:
        full_name[-1] += (" " + element.text)

for content in sorted(set(full_name)):
    print(content)

    
        
    
    

        
    
    


    
    

    





    
        

