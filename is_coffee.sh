#!/bin/bash

NAME="$1"
MENU="Javachip Americano Cafelatte"

is_coffee() {
    RETURN=$(echo $MENU | grep -i "$NAME")
}

is_coffee

if [ "$RETURN" = '' ] ; then
    echo ""$NAME"은 coffee가 아닙니다."
else
    echo ""$NAME"은 coffee가 맞습니다."
fi
