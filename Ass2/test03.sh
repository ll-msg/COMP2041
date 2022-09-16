#!/bin/dash

## delete command testing

# success delete with number as address
seq 1 5 | ./slippy '5d' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "1
2
3
4" ]; then
    echo "Test3.1 passed"
else
    echo "Test3.1 failed, actually $output1"
    exit 1
fi

# success delete with pattern as address
seq 2 10 | ./slippy '/[123]/d' > test_output.txt
output2=$(cat test_output.txt)
if [ "$output2" = "4
5
6
7
8
9" ]; then
    echo "Test3.2 passed"
else
    echo "Test3.2 failed, actually $output2"
    exit 1
fi

# single d command
seq 1 3 | ./slippy 'd' > test_output.txt
output3=$(cat test_output.txt)
if [ "$output3" = "" ]; then
    echo "Test3.3 passed"
else
    echo "Test3.3 failed, actually $output3"
    exit 1
fi