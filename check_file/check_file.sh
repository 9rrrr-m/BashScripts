#!/bin/bash

# Variable Description
F_LIST=/root/scripts/check_file/file_list.txt               # List of files to check
T_FILE=/var/tmp/.tmp1                                       # Temporary files
F_RESULT=/root/scripts/check_file/result.$(date +'%m%d')    # Result report file
EMAIL=root                                                  # Email address to receive results


# Main Function
# Initialize result file
cp /dev/null $F_RESULT

# File checking process
for F_NAME in $(cat $F_LIST)
do
    if [ -f $F_NAME.orig ] ; then              # Check for the existence of backup files
        diff $F_NAME $F_NAME.orig > $T_FILE    # Compare original files with backup files
        if [ -s $T_FILE ] ; then
            echo "[ WARN ]  $F_NAME" >> $F_RESULT
        else
            echo "[  OK  ]  $F_NAME" >> $F_RESULT
        fi
    else
        cp $F_NAME $F_NAME.orig
    fi
done

# Search for warning messages in the result file
if grep WARN $F_RESULT > /dev/null 2>&1 ; then
    mailx -s "Critical status. Check files." $EMAIL < $F_RESULT
    echo "[ WARNNING ] Please mail check."
else
    mailx -s "File check done. OK." $EMAIL < $F_RESULT
    echo "[    OK    ] File check done."
fi

# rm $T_FILE    # Delete temporary files
