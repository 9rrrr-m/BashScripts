#!/bin/bash

# Variable Definition
SERVER=192.168.10.30
U_NAME=user01
U_PASS=user01
FILENAME=linux_server2.tar.gz

# Function Definition
cmd() {
    sleep 4 ; echo "$U_NAME"
    sleep 1 ; echo "$U_PASS"
    sleep 1 ; echo "tar cvzf /tmp/$FILENAME /home/$U_NAME"
    sleep 1 ; echo 'exit'
}

# Main Function
cmd | telnet $SERVER

ftp -n $SERVER << EOF
    user $U_NAME $U_PASS
    cd /tmp
    lcd /root/scripts/backup
    bin
    hash
    prompt
    mget $FILENAME
    quit
EOF
