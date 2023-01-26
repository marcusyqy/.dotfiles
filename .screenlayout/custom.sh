#!/bin/sh
num_connected=`xrandr | grep " connected" | wc -l`

# will pass through if did not specify
if [ "$num_connected" -ne 1 ]
then
    # for 4k display in boston
    xrandr --output "HDMI-0" --primary --mode 2560x1440 --pos 0x0 --output eDP-1-1 --mode 1920x1080 --right-of "HDMI-0"
fi


# Welcome back notification/startup sound
echo 'Sending notification'
notify-send "Welcome back $(whoami)"
