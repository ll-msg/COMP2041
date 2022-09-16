#!/bin/dash

##tigger-branch testing
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi
if [ -f "branch-test" ]; then
    rm "branch-test"
fi
if [ -f ".tigger/branch/b1" ]; then
    rm -r ".tigger/branch/b1"
fi

./tigger-init 1>/dev/null
echo hello >branch-test
./tigger-add branch-test
./tigger-commit -m "commit1" 1>/dev/null

#listing branch
output1=$(./tigger-branch)
if [ "$output1" = "master" ]; then
    echo "Test9.1 passed"
else    
    echo "Test9.1 failed, incorrect branches list"
    exit 1
fi

#creating branch
./tigger-branch b1
if [ -d ".tigger/branch/b1" ]; then
    echo "Test9.2 passed"
else
    echo "Test9.2 failed, creating new branch failed"
    exit 1
fi

#deleting branch
./tigger-branch -d b1 1>/dev/null
if [ ! -d ".tigger/branch/b1" ]; then
    echo "Test9.3 passed"
else 
    echo "Test9.3 failed, deleting branch failed"
    exit 1
fi
