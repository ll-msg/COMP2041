#!/bin/dash

##tigger show testing
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi
if [ -f "show-test" ]; then 
    rm -r "show-test"
fi

./tigger-init 1>/dev/null

#missing arguments
output1=$(./tigger-show)
if [ "$output1" = "usage: tigger-show <commit>:<filename>" ]; then
    echo "Test4.1 passed"
else
    echo "Test4.1 failed, expected 'usage: tigger-show <commit>:<filename>', actually $output1"
    exit 1
fi

#invalid arguments
output2=$(./tigger-show 4)
if [ "$output2" = "tigger-show: error: invalid object 4" ]; then
    echo "Test4.2 passed"
else 
    echo "Test4.2 failed, expected 'tigger-show: error: invalid object 4', actually $output2"
    exit 1
fi
output3=$(./tigger-show 4:)
if [ "$output3" = "tigger-show: error: invalid filename ''" ]; then
    echo "Test4.3 passed"
else 
    echo "Test4.3 failed, expected tigger-show: error: invalid filename '', actually $output3"
    exit 1
fi

#file not in index
output4=$(./tigger-show :notexist)
if [ "$output4" = "tigger-show: error: 'notexist' not found in index" ]; then
    echo "Test4.4 passed"
else
    echo "Test4.4 failed, expected 'tigger-show: error: 'notexist' not found in index', actually $output4"
    exit 1
fi

#normal show
echo hello >show-test
./tigger-add show-test
./tigger-commit -m "commit1" 1>/dev/null

output5=$(./tigger-show 0:show-test)
if [ "$output5" = "hello" ]; then
    echo "Test4.5 passed"
else 
    echo "Test4.5 failed, expected 'hello', actually $output5"
    exit 1
fi

#unknown commit
output6=$(./tigger-show 5:show-test)
if [ "$output6" = "tigger-show: error: unknown commit '5'" ]; then
    echo "Test4.6 passed"
else 
    echo "Test4.6 failed, expected tigger-show: error: unknown commit '5', actually $output6"
    exit 1
fi


