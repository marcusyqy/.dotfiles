#!/bin/sh

link_nvim() {
    vimconfig="$HOME/.config/nvim"
    rm -rf $vimconfig
    ln -s $DOTFILES/nvim/ $vimconfig
}

link_tmux() {
    tmuxconfig="$HOME/.tmux.conf"
    rm $tmuxconfig
    ln -s $DOTFILES/tmux/.tmux.conf $tmuxconfig
}

link_alacritty() {
    #[ -d "~/.config/alacritty" ] &&
    rm -rf ~/.config/alacritty
    ln -s $DOTFILES/alacritty ~/.config/alacritty
}

link_wezterm() {
    #[ -d "~/.config/alacritty" ] &&
    weztermconfig="$HOME/.config/wezterm"
    rm -rf $weztermconfig
    ln -s $DOTFILES/wezterm $weztermconfig
}

link_zsh() {
    #[ -f "~/.zshrc" ] &&
    rm $HOME/.zshrc
    ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc
}


link_i3() {
    #[ -d "~/.config/fish" ] &&
    rm -rf $HOME/.config/i3
    rm -rf $HOME/.config/i3status
    ln -s $DOTFILES/i3 $HOME/.config/i3
    ln -s $DOTFILES/i3status $HOME/.config/i3status
}

link_rofi() {
    roficonfig="$HOME/.config/rofi"
    rm -rf $roficonfig
    ln -s $DOTFILES/rofi $roficonfig
}

link_wallpapers() {
    wallpaperconfig="$HOME/wallpapers"
    rm -rf $wallpaperconfig
    ln -s $DOTFILES/wallpapers $wallpaperconfig
}

link_screenlayout() {
    screenlayoutconfig="$HOME/.screenlayout"
    rm -rf $screenlayoutconfig
    ln -s $DOTFILES/.screenlayout $screenlayoutconfig
}

link_dunst() {
    dunstconfig="$HOME/.config/dunst"
    rm -rf $dunstconfig
    ln -s $DOTFILES/dunst $dunstconfig
}

link_picom() {
    picomconfig="$HOME/.config/picom.conf"
    rm $picomconfig
    ln -s $DOTFILES/picom/picom.conf $picomconfig
}

link_xprofile() {
    xprofileconfig="$HOME/.xprofile"
    rm $xprofileconfig
    ln -s $DOTFILES/.xprofile $xprofileconfig
}

link_awesomewm() {
    awesomeconfig="$HOME/.config/awesome"
    rm -rf $awesomeconfig
    ln -s $DOTFILES/awesome $awesomeconfig
}


link_nvim
link_alacritty
link_tmux
link_wezterm
link_zsh
link_i3
link_rofi
link_wallpapers
link_screenlayout
link_dunst
link_picom
link_xprofile
link_awesomewm
