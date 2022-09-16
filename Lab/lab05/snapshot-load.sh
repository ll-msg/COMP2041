#!/bin/dash

. snapshot-save.sh

targetDir=".snapshot.$1"
for files in "$targetDir"/*; do
    cat "$files" > "$(basename "$files")"
done
echo "Restoring snapshot $1"


