###Laptop Lid Closure without sleep
Edit /etc/systemd/logind.conf with root controls and edit these following settings
```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

###Prerequisites
- dunst
- feh
- i3-gaps
- oh-my-zsh
- vim-plug
- xrandr
- gnome-screenshot
- pavucontrol
