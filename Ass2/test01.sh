#!/bin/dash

## quit command testing

# success quit with number as address
seq 1 20 |  ./slippy '/.*3/q' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "1
2
3" ]; then
    echo "Test1.1 passed"
else
    echo "Test1.1 failed, actually $output1"
    exit 1
fi

# single q command
seq 1 20 | ./slippy 'q' > test_output.txt
output2=$(cat test_output.txt)
if [ "$output2" = "1" ]; then
    echo "Test1.2 passed"
else
    echo "Test1.2 failed, actually $output2"
    exit 1
fi
