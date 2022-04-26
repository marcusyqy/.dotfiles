#!/bin/sh

non_connected_laptops=`xrandr | grep " connected " | grep -v "eDP-1" | awk '{print$1}'`
if [ -z "$non_connected_laptops" ]
then
    xrandr --auto
else
    #turn off current laptop screen and turn on another screen :)
    xrandr --auto && xrandr --output eDP-1-1 --off && xrandr --output $(xrandr | grep " connected " | grep -v "eDP-1" | awk '{print$1}') --primary
fi

