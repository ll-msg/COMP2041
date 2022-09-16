#!/bin/dash

## substitute command testing

# success substitute without address
seq 1 5 | ./slippy 's/5/hello/' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "1
2
3
4
hello" ]; then
    echo "Test4.1 passed"
else
    echo "Test4.1 failed, actually $output1"
    exit 1
fi

# success substitute without address
seq 2 10 |  ./slippy 's/[123]/d/' > test_output.txt
output2=$(cat test_output.txt)
if [ "$output2" = "d
d
4
5
6
7
8
9
d0" ]; then
    echo "Test4.2 passed"
else
    echo "Test4.2 failed, actually $output2"
    exit 1
fi
