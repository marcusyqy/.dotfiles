# .dotfiles
basic settings for development dotfiles.

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
- homebrew(install latest lazygit)


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

## Screen brightness light
1)
```
sudo apt install light
```
2)
```
sudo chmod +s /usr/bin/light
```
3) Add to i3 config:
```
bindsym XF86MonBrightnessUp exec light -A 1 # increase screen brightness
bindsym XF86MonBrightnessDown exec light -U 1 # decrease screen brightness
```

## Audio gui
1) install dep
sudo apt-get install pulseaudio pavucontrol

2) run
pavucontrol

### git best practices
git config --global pull.rebase true

##Swapping control and caps lock
To change capslock to ctrl for your current session, type:
`setxkbmap -option ctrl:nocaps`

To make it permanent, put it in your ~/.xinitrc. Alternately, if you have root access, then edit /etc/default/keyboard and add:

`XKBOPTIONS="ctrl:nocaps"`
setxkbmap -query

#switch to dvorak
alias asdf='setxkbmap dvorak'

#switch to us qwerty
alias aoeu='setxkbmap us'

## git work trees
 If your repo is going to make use of Git LFS, at
 this point you should stop and edit `.bare/config`
 so that the `[remote "origin"]` section reads as:

 [remote "origin"]
         url = git@github.com:example/workit.git
         fetch = +refs/heads/*:refs/remotes/origin/*

 This ensures that new worktrees do not attempt to
 re-upload every resource on first push.

```
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git fetch
git for-each-ref --format='%(refname:short)' refs/heads | xargs -n1 -I{} git branch --set-upstream-to=origin/{}
```

### cursor
https://wiki.archlinux.org/title/Cursor_themes#Configuration


### list fonts
fc-match NameOfFont -s


