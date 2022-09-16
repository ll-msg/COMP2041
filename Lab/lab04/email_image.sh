#!/bin/dash

for email in "$@"; do
    display $email
    echo -n "Address to e-mail this image to? "
    read receiver
    if  [ -z "$receiver" ]; then
        echo "No email sent"
    else 
        echo -n "Message to accompany image? "
        read msg

        file=$(echo "$email" | cut -d"." -f1)
        echo $msg | mutt -s "$file""!" -e 'set copy=no' -a "$email" -- "$receiver"
        echo "$email sent to $receiver"
    fi
done