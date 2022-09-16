#!/bin/dash

file_No="$#"
if [ $file_No -le 1 ]; then
    echo "No files can be replaced by symbolic links"
fi

already_check=""
checked=false

for file1 in "$@"; do
    for file2 in "$@"; do
        if cmp --silent -- "$file1" "$file2"; then
            if [ "$file1" != "$file2" ]; then
                if echo "$already_check" | grep -q "$file1"; then
                    continue
                else
                    echo "ln -s $file1 $file2"
                    checked=true
                    already_check=$already_check$file2
                fi
            fi
        fi
    done
done

if [ $checked = false ]; then
    echo "No files can be replaced by symbolic links"
fi