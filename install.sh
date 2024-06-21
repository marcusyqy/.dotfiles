#!/bin/sh

install_fonts() {
    #[ -f "~/.tmux.conf" ] &&
    rm -rf ~/.fonts
    cp -r $DOTFILES/.fonts ~/.fonts
}

install_alacritty_config() {
    #[ -d "~/.config/alacritty" ] &&
    rm -rf ~/.config/alacritty
    cp -r $DOTFILES/alacritty ~/.config/alacritty
}

install_fonts
