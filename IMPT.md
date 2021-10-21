###Laptop Lid Closure without sleep
Edit /etc/systemd/logind.conf with root controls and edit these following settings
```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```
