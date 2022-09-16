#!/bin/dash

## print command testing

# success print with number as address
seq 1 5 | ./slippy '3p' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "1
2
3
3
4
5" ]; then
    echo "Test2.1 passed"
else
    echo "Test2.1 failed, actually $output1"
    exit 1
fi

# success print with pattern as address
seq 2 10 | ./slippy '/.*8/p' > test_output.txt
output2=$(cat test_output.txt)
if [ "$output2" = "2
3
4
5
6
7
8
8
9
10" ]; then
    echo "Test2.2 passed"
else
    echo "Test2.2 failed, actually $output2"
    exit 1
fi

# single p command
seq 1 3 | ./slippy 'p' > test_output.txt
output3=$(cat test_output.txt)
if [ "$output3" = "1
1
2
2
3
3" ]; then
    echo "Test2.3 passed"
else
    echo "Test2.3 failed, actually $output3"
    exit 1
fi