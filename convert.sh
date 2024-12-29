#!/bin/bash

# Convert space-separated .txt file to .csv format

# Usage
if [ $# -ne 2 ] ; then
    echo "Usage: $0 <IN_FILE> <OUT_FILE>"
fi

# Environment Setting
export LANG=en_US.UTF-8

# Variable Definition
IN_FILE=$1     # .txt
OUT_FILE=$2    # .csv
> $OUT_FILE

# Main Function
cat $IN_FILE | while read ID NAME EMAIL PHONE ADDR
do
    echo "$ID,$NAME,$EMAIL,$PHONE,$ADDR" >> $OUT_FILE
done
