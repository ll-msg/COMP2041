#!/bin/dash

## -n command testing

# print command with -n
seq 1 5 | ./slippy -n '4p' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "4" ]; then
    echo "Test6.1 passed"
else
    echo "Test6.1 failed, actually $output1"
    exit 1
fi

# other command with -n
seq 1 5 | ./slippy -n '4d' > test_output.txt
output2=$(cat test_output.txt)
if [ "$output2" = "" ]; then
    echo "Test6.2 passed"
else
    echo "Test6.2 failed, actually $output2"
    exit 1
fi