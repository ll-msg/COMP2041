#!/bin/dash

for jpgFile in *.jpg; do
    name=$(echo "$jpgFile" | cut -d"." -f1)
    pngFile="$name"".png"
    
    if [ -f "$pngFile" ]; then
        echo "$pngFile already exists"
        exit 1
    fi
 
    convert "$jpgFile" "$pngFile" > /dev/null 2>&1
    rm "$jpgFile"
done