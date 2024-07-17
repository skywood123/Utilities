#!/bin/bash
DEVICE=$1
if [ "$1" == "" ] ; then 
    DEVICE="VGA-1"  
fi
MODELINE=\"$(cvt 1920 1080 | grep -e "^#" -v | cut -d '"' -f 2-)
MODENAME=$(echo $MODELINE | cut -d " " -f 1)
MODEPARAMS=$(echo $MODELINE | cut -d " " -f 2-)
sudo xrandr --newmode $MODENAME $MODEPARAMS
sudo xrandr --addmode $DEVICE $MODENAME