#!/bin/bash

# Usage
if [ $# -ne 3 ] ; then
    echo "Usage: $0 <directory> <orig_ext> <new_ext>"
    exit 1
fi

# Variable Definition
D_WORK=$1            # working directory
ORIG=$2              # original extension
NEW=$3               # new extension
T_FILE=/tmp/.tmp1    # temporary file

# Main Function
ls -1 $D_WORK | grep ".$ORIG$" > $T_FILE
for FILE in $(cat $T_FILE)
do
    mv $D_WORK/$FILE $(echo $D_WORK/$FILE | sed "s/.$ORIG$/.$NEW/g")
done
