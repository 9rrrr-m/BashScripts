#!/bin/bash

trap 'pkill -9 cpuhog.sh ; exit 1' 2 3

# Main Function
./cpuhog.sh &
sleep 10

./cpuhog.sh &
sleep 10

./cpuhog.sh &
sleep 6000

trap 2 3
