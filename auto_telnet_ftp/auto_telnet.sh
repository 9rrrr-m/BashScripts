#!/bin/bash

# Variable Definition
SERVER_LIST=/root/scripts/test/telnet_serverlist.txt

# Function Definition
cmd() {
    sleep 4 ; echo "$U_NAME"
    sleep 1 ; echo "$U_PASS"
    sleep 1 ; echo 'hostname'
    sleep 1 ; echo 'ls -l'
    sleep 1 ; echo 'exit'
}

# Main Function
cat $SERVER_LIST | while read HOST U_NAME U_PASS
do
    cmd | telnet $HOST
    echo "=========================================================="
done
