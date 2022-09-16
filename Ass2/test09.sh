#!/bin/dash

# -f command option line testing

echo /.*8/p > commands.slippy
echo /2/d >> commands.slippy
seq 1 5 | ./slippy -f commands.slippy > test_output.txt
output1=$(cat test_output.txt)
if [ "$output1" = "1
3
4
5" ]; then
    echo "Test9.1 passed"
else
    echo "Test9.1 failed, actually $output1"
    exit 1
fi