#!/bin/bash

trap 'pkill -9 cpuhog3.sh ; exit 1' 2 3

# Main Function
./cpuhog3.sh &
sleep 10

./cpuhog3.sh &
sleep 10

./cpuhog3.sh &
sleep 6000

trap 2 3
