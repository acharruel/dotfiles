#!/bin/sh

DISPLAYS=`swaymsg -t get_outputs -p | grep "Output" | awk '{print $2}'`
BASE_FILE="/tmp/ss"

args=""

for display in $DISPLAYS; do
    FILE=${BASE_FILE}${display}.png
    grim -o $display $FILE
    corrupter $FILE $FILE
    args="$args -i ${display}:${FILE}"
done

swaylock $args $@
