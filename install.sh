
install_vim_config() {
    rm -rf ~/.config/nvim
    cp -r $DOTFILES/nvim/ ~/.config/nvim
}

install_tmux_config() {
    rm ~/.tmux.conf
    cp $DOTFILES/tmux/.tmux.conf ~/.tmux.conf
}

install_zsh_config() {
    rm ~/.zshrc
    cp $DOTFILES/zsh/.zshrc ~/.zshrc
}


install_vim_config
install_tmux_config
install_zsh_config
