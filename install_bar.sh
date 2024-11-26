#!/bin/bash

# Main Function
for i in $(seq 1 10)
do
    # Percent%
    PER=$(expr $i \* 10)
    echo -ne "$PER% |"

    # Bar(==) print
    START=1
    while [ $START -le $i ]
    do
        echo -ne "=="
        START=$(expr $START + 1)
    done

    # '>' or 'complete' print
    if [ $i -ne 10 ] ; then
        echo -ne ">"
    else
        echo -ne "| complete\n"
    fi

    echo -ne "\r"
    sleep 1
done
