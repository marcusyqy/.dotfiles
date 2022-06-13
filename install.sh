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

install_fish_config() {
    #[ -d "~/.config/fish" ] &&
    rm -rf ~/.config/fish
    cp -r $DOTFILES/fish/ ~/.config/fish
}


install_polybar_config() {
    rm -rf ~/.config/polybar
    cp -r $DOTFILES/polybar ~/.config/polybar
}

install_compton_config() {
    rm ~/.config/compton.conf
    cp $DOTFILES/compton/compton.conf ~/.config/compton.conf
}

install_fonts
