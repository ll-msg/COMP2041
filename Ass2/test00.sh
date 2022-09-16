#!/bin/dash

## quit command testing

# success quit with number as address
seq 1 5 | ./slippy '4q' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "1
2
3
4" ]; then
    echo "Test0.1 passed"
else
    echo "Test0.1 failed, actually $output1"
    exit 1
fi



