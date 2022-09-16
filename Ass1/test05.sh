#!/bin/dash

##tigger commit-a testing
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi
if [ -f "commit1-test" ]; then 
    rm -r "commit1-test"
fi

./tigger-init 1>/dev/null
echo hello >commit1-test
./tigger-add commit1-test
./tigger-commit -m "commit1" 1>/dev/null
echo world >commit1-test
./tigger-commit -a -m "commit2" 1>/dev/null

output=$(./tigger-show 0:commit1-test)
if [ "$output" = "hello" ]; then
    echo "Test5 passed"
else 
    echo "Test5 failed, commit -a failed"
    exit 1
fi