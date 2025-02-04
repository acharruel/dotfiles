#!/bin/sh

DISPLAYS=`swaymsg -t get_outputs -p | grep "Output" | awk '{print $2}'`
BASE_FILE="/tmp/ss"

# nord polar night
nord0=2E3440 # black
nord1=3B4252 # dark grey
nord2=434C5E # grey
nord3=4C566A # light grey

# nord snow storm
nord4=D8DEE9 # white
nord5=E5E9F0 # light grey
nord6=ECEFF4 # grey

# nord frost
nord7=8FBCBB # cyan
nord8=88C0D0 # light blue
nord9=81A1C1 # blue
nord10=5E81AC # dark blue

# nord aurora
nord11=BF616A # red
nord12=D08770 # orange
nord13=EBCB8B # yellow
nord14=A3BE8C # green
nord15=B48EAD # purple

nord16=6090a4 # light blue

opts_clear=" \
    --inside-clear-color $nord6 \
    --line-clear-color $nord4 \
    --ring-clear-color $nord4 \
    --text-clear-color $nord2 \
    "

opts_ver=" \
    --inside-ver-color $nord10 \
    --line-ver-color $nord9 \
    --ring-ver-color $nord9 \
    --text-ver-color $nord1 \
    "

opts_wrong=" \
    --inside-wrong-color $nord11 \
    --line-wrong-color $nord12 \
    --ring-wrong-color $nord12 \
    --text-wrong-color $nord5 \
    "

opts_colors=" \
    --inside-color $nord1 \
    --line-color $nord0 \
    --ring-color $nord0 \
    --text-color $nord6 \
    --key-hl-color $nord3 \
    "

opts_caps_lock=" \
    --inside-caps-lock-color $nord11 \
    --line-caps-lock-color $nord12 \
    --ring-caps-lock-color $nord12 \
    --text-caps-lock-color $nord5 \
    "

args="$opts_colors $opts_clear $opts_ver $opts_caps_lock"

for display in $DISPLAYS; do
    FILE=${BASE_FILE}${display}.png
    grim -o $display $FILE
    /home/adrien/.bin/corrupter $FILE $FILE
    args="$args -i ${display}:${FILE}"
done

swaylock $args $@
