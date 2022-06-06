#!/bin/sh

xinput set-prop "pointer:Logitech G Pro " "libinput Natural Scrolling Enabled" 0
xinput set-prop "pointer:Logitech MX Master 3" "libinput Natural Scrolling Enabled" 0
xinput set-prop "UNIW0001:00 093A:1336 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "Synaptics TM3512-010" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ELAN1200:00 04F3:3066 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1
setxkbmap -option ctrl:nocaps
