#!/bin/dash

## substitute command with different delimiter testing
seq 1 5 | ./slippy 's?5?hello?' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "1
2
3
4
hello" ]; then
    echo "Test7.1 passed"
else
    echo "Test7.1 failed, actually $output1"
    exit 1
fi

seq 1 5 | ./slippy 'sW5WhelloW' > test_output.txt
output2=$(cat test_output.txt)
if [ "$output2" = "1
2
3
4
hello" ]; then
    echo "Test7.2 passed"
else
    echo "Test7.2 failed, actually $output2"
    exit 1
fi