
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
    cp $DOTFILES/i3/config ~/.config/i3/config
}


install_vim_config
install_tmux_config
#install_fish_config
#install_zsh_config
install_alacritty_config
