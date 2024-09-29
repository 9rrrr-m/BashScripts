#!/bin/bash

# Variable Definition
D_WORK=/root/scripts/move_filename    # working directory
T_FILE=/tmp/.tmp1                     # temporary file

# Main Function
ls -1 $D_WORK | grep '.txt$' > $T_FILE
for FILE in $(cat $T_FILE)
do
    mv $D_WORK/$FILE $(echo $D_WORK/$FILE | sed 's/.txt$/.els/g')
done
