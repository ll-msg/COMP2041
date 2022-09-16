#!/bin/dash

##tigger-rm testing

if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi

./tigger-init 1>/dev/null

#no file
output1=$(./tigger-rm notexist)
if [ "$output1" = "tigger-rm: error: 'notexist' is not in the tigger repository" ]; then
    echo "Test6 passed"
else 
    echo "Test6 failed, expected tigger-rm: error: 'notexist' is not in the tigger repository, actually $output1"
    exit1
fi

