#!/bin/bash

# Variable Definition
NET=192.168.10.
START=200
END=230
TERM=1

# Main Function
while [ $START -le $END ]
do
    ping -c 1 ${NET}${START} > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "${NET}${START}    : alive"
    else
        echo "${NET}${START}    : dead"
    fi
    START=`expr $START + $TERM`
done
