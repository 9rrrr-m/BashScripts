#!/bin/bash

# Variable Definition
SERVER_LIST=/root/scripts/test/serverlist.txt

# Main Function
# FTP 수행
for IP in `cat $SERVER_LIST`
do
    ftp -n $IP << EOF
    user testuser password
    cd /tmp
    lcd /root/scripts/test
    bin
    hash
    prompt
    mput testfile.txt
    quit
EOF
done
