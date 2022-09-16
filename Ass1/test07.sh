#!/bin/dash

##tigger-rm normal cases
if [ -d ".tigger" ]; then
    rm -r ".tigger"
fi
if [ -f "rm-test" ]; then 
    rm -r "rm-test"
fi

./tigger-init 1>/dev/null
echo hello >rm-test
./tigger-add rm-test

./tigger-rm --cached rm-test
if [ -f "rm-test" ] && [ ! -f ".tigger/branch/master/index/rm-test" ]; then
    echo "Test7.1 passed"
else 
    echo "Test7.1 failed, cached remove failed"
    exit 1
fi

echo hello >rm1-test
./tigger-add rm1-test
./tigger-rm --force rm1-test
if [ ! -f "rm1-test" ] && [ ! -f ".tigger/branch/master/index/rm1-test" ]; then
    echo "Test7.2 passed"
else 
    echo "Test7.2 failed, force remove failed"
    exit 1
fi