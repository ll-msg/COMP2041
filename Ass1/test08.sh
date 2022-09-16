#!/bin/dash

##tigger-status testing
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi
if [ -f "status-test" ]; then 
    rm -r "status-test"
fi
if [ -f "status1-test" ]; then 
    rm -r "status1-test"
fi

./tigger-init 1>/dev/null
echo hello >status-test
./tigger-add status-test
./tigger-commit -m "commit1" 1>/dev/null
echo world >status1-test
./tigger-add status1-test
./tigger-commit -m "commit2" 1>/dev/null
rm status-test

output1=$(./tigger-status | grep "status-test")
if [ "$output1" = "status-test - file deleted" ]; then
    echo "Test8.1 passed"
else 
    echo "Test8.1 failed, expected 'status-test - file deleted', actually $output1"
    exit 1
fi

output2=$(./tigger-status | grep "status1-test")
if [ "$output2" = "status1-test - same as repo" ]; then
    echo "Test8.2 passed"
else 
    echo "Test8.2 failed, expected 'status1-test - same as repo', actually $output1"
    exit 1
fi
