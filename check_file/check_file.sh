#!/bin/bash

# Variable Description
F_LIST=/root/scripts/check_file/file_list.txt               # List of files to check
T_FILE1=/var/tmp/tmp1                                       # Temporary files
T_FILE2=/var/tmp/tmp2                                       # Temporary files
T_FILE3=/var/tmp/tmp3                                       # Temporary files
F_RESULT=/root/scripts/check_file/result.$(date +'%m%d')    # Result report file
EMAIL=root                                                  # Email address to receive results

# Main Function
# Initialize result file
> $F_RESULT

# File checking process
for F_NAME in $(cat $F_LIST)
do
    if [ -f $F_NAME.orig ] ; then               # Check for the existence of backup files
        diff $F_NAME $F_NAME.orig > $T_FILE1    # Compare original files with backup files
        if [ -s $T_FILE1 ] ; then
            echo "[ WARN ]  $F_NAME" >> $F_RESULT
        else
            echo "[  OK  ]  $F_NAME" >> $F_RESULT
        fi
    else
        /bin/cp -p $F_NAME $F_NAME.orig
    fi
done

# Search for warning messages in the result file
grep WARN $F_RESULT > $T_FILE2 2>&1

if [ $? -eq 0 ] ; then
    mailx -s "[ WARN ] Critical status. Check files." $EMAIL < $F_RESULT
    cat $T_FILE2 | awk '{print $4}' > $T_FILE3
    for WARN_FILE in $(cat $T_FILE3)
    do
        /bin/cp -p $WARN_FILE $WARN_FILE.$(date +%m%d_%H%M%S)
        /bin/cp -p $WARN_FILE.orig $WARN_FILE.orig.$(date +%m%d_%H%M%S)
        /bin/cp -p $WARN_FILE $WARN_FILE.orig
    done
else
    mailx -s "[  OK  ] File check done. Have a good day." $EMAIL < $F_RESULT
fi
