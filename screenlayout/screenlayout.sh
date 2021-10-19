#!/bin/sh
#xrandr --output DP-1 --off --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off

sleep .1
if xrandr | grep 'DP-0' | grep ' connected' &>/dev/null; then
  echo 'DP-0 connected, restoring layout'
  xrandr --output DP-0 --primary --mode 3440x1440 --pos 0x0 --rate 144.0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-0 --off --output eDP-1-1 --off
else
  echo 'No DP-0 detected, reverting to laptop display'
  xrandr --output DP-1 --off --output HDMI-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off
fi

echo 'Calling feh for desktop wallpaper'
sh ~/wallpapers/wallpapers.sh
echo 'Running polybar'
polybar top &
echo 'Done'

# Welcome back notification/startup sound
echo 'Sending notification'
notify-send "Bentornato $(whoami)"
