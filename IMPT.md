## Laptop Lid Closure without sleep
Edit /etc/systemd/logind.conf with root controls and edit these following settings
```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

## Prerequisites
- dunst
- feh
- i3-gaps
- oh-my-zsh
- vim-plug
- xrandr
- gnome-screenshot
- pavucontrol
- picom


## Use dunst
Dunst
- install should put in  ~/.config/dunst/dunstrc
- reload dunst file
```
killall dunst;notify-send hello-world.
```

## Bluetooth
- Use blueman-applet for gui (probably in status bar)
## Network Manager (WiFi)
- Use nm-tui (terminal ui for network manager)
- Use nm-applet for gui (probably in status bar)
## Input devices
- xinput // show number of devices
- xinput list-props {device_name/device_id} // show properties
