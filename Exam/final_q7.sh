#!/bin/dash

for fileName in "$@"; do

    head_line=$(head -1 $fileName)
    echo $head_line > temp_q7

    if $(echo $fileName | grep -Fqe "."); then
        echo "# $fileName already has an extension"
    elif ! $(echo $head_line | grep -Fqe "#!"); then
        echo "# $fileName does not have a #! line"
    elif ! grep -E "perl|python|sh" temp_q7 >>/dev/null; then
        echo "# $fileName no extension for #! line"
    elif $(echo $head_line | grep -Fqe "perl"); then
        if [ -f "$fileName.pl" ]; then
            echo "# $fileName.pl already exists"
        else
            echo "mv $fileName $fileName.pl"
        fi
    elif $(echo $head_line | grep -Fqe "python"); then
        if [ -f "$fileName.py" ]; then
            echo "# $fileName.py already exists"
        else 
            echo "mv $fileName $fileName.py"
        fi
    elif $(echo $head_line | grep -Fqe "sh"); then
        if [ -f "$fileName.sh" ]; then
            echo "# $fileName.sh already exists"
        else
            echo "mv $fileName $fileName.sh"
        fi
    fi
done