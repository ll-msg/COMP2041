#!/bin/dash

original=$1
start=0

while true; do
    copyFile=".$original.$start"
    if [ ! -f "$copyFile" ]; then
        cat "$original" >> "$copyFile"
        echo "Backup of '$original' saved as '$copyFile'"
        break
    fi
    start=$(( $start+1 ))
done

    
    