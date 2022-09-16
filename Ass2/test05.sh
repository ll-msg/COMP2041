#!/bin/dash

## more substitute command testing

# success substitute with g command
echo Hello there | ./slippy 's/e/1/g' > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "H1llo th1r1" ]; then
    echo "Test5.1 passed"
else
    echo "Test5.1 failed, actually $output1"
    exit 1
fi

# success substitute without address (input string without g)
echo Hello there |  ./slippy 's/e/1/' > test_output.txt
output2=$(cat test_output.txt)
if [ "$output2" = "H1llo there" ]; then
    echo "Test5.2 passed"
else
    echo "Test5.2 failed, actually $output2"
    exit 1
fi

# success substitute with number as address
seq 15 20 | ./slippy '3s/1/2/' > test_output.txt
output3=$(cat test_output.txt)
if [ "$output3" = "15
16
27
18
19
20" ]; then
    echo "Test5.3 passed"
else
    echo "Test5.3 failed, actually $output3"
    exit 1
fi
