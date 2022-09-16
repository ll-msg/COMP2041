#!/bin/dash

fileName=$1
sort -n $fileName > temp_file
start=$(head -1 temp_file)
end=$(tail -1 temp_file)
i=$start

while [ $i -le $end ]; do
    if ! grep -q $i "temp_file"; then
        echo $i
    fi
    i=`expr $i + 1`
done