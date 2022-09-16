#!/bin/dash

##tigger log testing
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi
if [ -f "log-test" ]; then 
    rm -r "log-test"
fi

./tigger-init 1>/dev/null
echo hello >log-test
./tigger-add log-test
./tigger-commit -m "commit1" 1>/dev/null

output=$(./tigger-log)
if [ "$output" = "0 commit1" ]; then
    echo "Test3 passed"
else 
    echo "Test3 failed, tigger log incorrect"
    exit 1
fi