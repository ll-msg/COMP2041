#!/bin/dash

start=0
newDir=".snapshot.0"
while true; do
    newDir=".snapshot.$start"
    if [ ! -d "$newDir" ]; then
        mkdir $newDir
        echo "Creating snapshot $start"
        break
    fi
    start=$(( $start+1 ))
done


for files in *; do 
    if [ "$files" != ".*" ] && [ "$files" != "snapshot-save.sh" ] && [ "$files" != "snapshot-load.sh" ]; then
        cat "$files" >> "$newDir/$files"
    fi
done