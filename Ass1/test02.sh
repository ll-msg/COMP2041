#!/bin/dash

##tigger commit -m testing
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi
if [ -f "commit-test" ]; then 
    rm -r "commit-test"
fi

./tigger-init 1>/dev/null
echo hello >commit-test
./tigger-add commit-test

#missing arguments
output1=$(./tigger-commit)
if [ "$output1" = "usage: tigger-commit [-a] -m commit-message" ]; then
    echo "Test2.1 passed"
else
    echo "Test2.1 failed, expected 'usage: tigger-commit [-a] -m commit-message', actually $output1"
    exit 1
fi

#normal commit
output2=$(./tigger-commit -m "commit1")
if [ "$output2" = "Committed as commit 0" ] && [ -d ".tigger/branch/master/commit0" ]; then
    echo "Test2.2 passed"
else 
    echo "Test2.2 failed, first commit failed"
    exit 1
fi

#nothing to commit
output3=$(./tigger-commit -m "commit2")
if [ "$output3" = "nothing to commit" ]; then
    echo "Test2.3 passed"
else 
    echo "Test2.3 failed, commit no changes failed"
    exit 1
fi