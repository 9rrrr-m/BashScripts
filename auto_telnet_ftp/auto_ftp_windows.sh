#!/bin/bash

# Variable Definition
IP=192.168.0.7
PORT=2121
U_NAME=testuser
U_PASS=password
FILENAME=testfile.txt

# Main Function
ftp -n $IP $PORT << EOF
    user $U_NAME $U_PASS
    cd C:\ftp
    lcd /root/scripts/test
    bin
    hash
    prompt
    mput $FILENAME
    quit
EOF
