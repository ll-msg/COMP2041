#!/bin/dash

##tigger-add testing
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi
if [ -f "add-test" ]; then 
    rm -r "add-test"
fi

./tigger-init 1>/dev/null
touch add-test
#missing arguments
output1=$(./tigger-add)
if [ "$output1" = "usage: tigger-add <filenames>" ]; then
    echo "Test1.1 passed"
else 
    echo "Test1.1 failed, expected 'usage: tigger-add <filenames>', actually $output1"
    exit 1
fi

#the file added does not exist
output2=$(./tigger-add notexist)
if [ "$output2" = "tigger-add: error: can not open 'notexist'" ]; then
    echo "Test1.2 passed"
else
    echo "Test1.2 failed, expected tigger-add: error: can not open 'notexist', actually $output2"
    exit 1
fi

#normal add
./tigger-add add-test
if [ -f ".tigger/branch/master/index/add-test" ]; then
    echo "Test1.3 passed"
else 
    echo "Test1.3 failed, add file 'add-test' failed"
    exit 1
fi

#if correctly overwrite file with same name
echo hello >add-test
./tigger-add add-test
if [ "$(cat add-test)" = "$(cat ".tigger/branch/master/index/add-test")" ]; then
    echo "Test1.4 passed"
else
    echo "Test1.4 failed, didn't successfully update files"
    exit 1
fi