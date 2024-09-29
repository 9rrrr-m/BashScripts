#!/bin/bash

# Usage
if [ $# -ne 1 ] ; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Variable Definition
D_WORK=$1            # working directory
T_FILE=/tmp/.tmp1    # temporary file

# Main Function
ls -1 $D_WORK | grep '.els$' > $T_FILE
for FILE in $(cat $T_FILE)
do
    mv $D_WORK/$FILE $(echo $D_WORK/$FILE | sed 's/.els$/.txt/g')
done
