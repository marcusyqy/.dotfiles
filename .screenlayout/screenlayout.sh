#!/bin/sh
is_any_wide_screen=xrandr | grep " connected " | grep -v "eDP-1" | awk '{print$1}' | grep "DP"

sleep .1
if [ -z $is_any_wide_screen ]
then
  echo 'DP-0 connected, restoring layout'
  xrandr --output $(xrandr | grep " connected " | grep -v "eDP-1" | awk '{print$1}') --primary --mode 3440x1440 --pos 0x0 --rate 144.0 --rotate normal --output eDP-1 --off
else
  echo 'No DP-0/DP-1 detected, reverting to laptop display'
  sh default.sh
  #xrandr --output DP-1 --off --output HDMI-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off
fi

echo 'Calling feh for desktop wallpaper'
sh ~/wallpapers/scripts/wallpaper.sh
echo 'Running polybar'
polybar top &
echo 'Done'

# Welcome back notification/startup sound
echo 'Sending notification'
notify-send "Welcome $(whoami)"
