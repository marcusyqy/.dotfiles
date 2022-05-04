#!/bin/sh
install_vim_config() {
    #[ -d "~/.config/nvim" ] &&
    rm -rf ~/.config/nvim
    cp -r $DOTFILES/nvim/ ~/.config/nvim
}

install_tmux_config() {
    #[ -f "~/.tmux.conf" ] &&
    rm ~/.tmux.conf
    cp $DOTFILES/tmux/.tmux.conf ~/.tmux.conf
}

install_alacritty_config() {
    #[ -d "~/.config/alacritty" ] &&
    rm -rf ~/.config/alacritty
    cp -r $DOTFILES/alacritty ~/.config/alacritty
}

install_kitty_config() {
    #[ -d "~/.config/alacritty" ] &&
    rm -rf ~/.config/kitty
    cp -r $DOTFILES/kitty ~/.config/kitty
}

install_zsh_config() {
    #[ -f "~/.zshrc" ] &&
    rm ~/.zshrc
    cp $DOTFILES/zsh/.zshrc ~/.zshrc
}

install_fish_config() {
    #[ -d "~/.config/fish" ] &&
    rm -rf ~/.config/fish
    cp -r $DOTFILES/fish/ ~/.config/fish
}

install_i3_config() {
    #[ -d "~/.config/fish" ] &&
    rm ~/.config/i3/config
    rm ~/.config/i3status/config
    cp $DOTFILES/i3/config ~/.config/i3/config
    cp $DOTFILES/i3status/config ~/.config/i3status/config
}

install_polybar_config() {
    rm -rf ~/.config/polybar
    cp -r $DOTFILES/polybar ~/.config/polybar
}

install_rofi_config() {
    rm -rf ~/.config/rofi
    cp -r $DOTFILES/rofi ~/.config/rofi
}

install_wallpapers_config() {
    rm -rf ~/wallpapers
    cp -r $DOTFILES/wallpapers ~/wallpapers
}

install_compton_config() {
    rm ~/.config/compton.conf
    cp $DOTFILES/compton/compton.conf ~/.config/compton.conf
}

install_screenlayout_config() {
    rm -rf ~/.screenlayout
    cp -r $DOTFILES/.screenlayout ~/.screenlayout
}

install_dunst_config() {
    rm -rf ~/.config/dunst
    cp -r $DOTFILES/dunst ~/.config/dunst
}

install_picom_config() {
    rm  ~/.config/picom.conf
    cp $DOTFILES/picom/picom.conf ~/.config/picom.conf
}

install_vim_config
install_tmux_config
# install_fish_config
install_zsh_config
install_alacritty_config
install_kitty_config
install_i3_config
install_polybar_config
install_rofi_config
install_wallpapers_config
install_compton_config
install_screenlayout_config
install_dunst_config
install_picom_config

