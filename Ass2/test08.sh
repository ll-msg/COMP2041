#!/bin/dash

## multi-commands testing

seq 1 5 | 2041 slippy '3q;/^2/d' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "1
3" ]; then
    echo "Test8.1 passed"
else
    echo "Test8.1 failed, actually $output1"
    exit 1
fi