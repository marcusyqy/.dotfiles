#!/bin/sh

#turn off current laptop screen and turn on another screen :)
xrandr --auto && xrandr --output eDP-1 --off && xrandr --output $(xrandr | grep " connected " | grep -v "eDP-1" | awk '{print$1}') --primary
