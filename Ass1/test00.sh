#!/bin/dash

##tigger-init testing
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi

#check success init
output1=$(./tigger-init)
if [ "$output1" = "Initialized empty tigger repository in .tigger" ] && [ -d ".tigger" ]; then
    echo "Test0.1 passed"
else 
    echo "Test0.1 failed, expected 'Initialized empty tigger repository in .tigger', actually $output1"
    exit 1
fi

#check repeated init
output2=$(./tigger-init)
if [ "$output2" = "tigger-init: error: .tigger already exists" ]; then
    echo "Test0.2 passed"
else 
    echo "Test0.2 failed, expected 'tigger-init: error: .tigger already exists', actually $output2"
    exit 1
fi

#check init files
if [ -f ".tigger/file-log.txt" ] && [ -f ".tigger/branches.txt" ] && [ -f ".tigger/branch/master/commit-save.txt" ] && [ -d ".tigger/branch/master/index" ]; then
    echo "Test0.3 passed"
else 
    echo "Test0.3 failed, missing files"
    exit 1
fi

#check init branch
curr_branch=$(cat ".tigger/branches.txt")
if [ "$curr_branch" = "master" ]; then
    echo "Test0.4 passed"
else 
    echo "Test0.4 failed, expected 'master', actually $curr_branch"
fi

