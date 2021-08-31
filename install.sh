
install_vim_config() {
    rm -rf ~/.config/nvim
    cp -r nvim/ ~/.config/nvim
}

install_tmux_config() {
    rm ~/.tmux.conf
    cp tmux/.tmux.conf ~/.tmux.conf
}

install_zsh_config() {
    rm ~/.zshrc
    cp zsh/.zshrc ~/.zshrc
}


install_vim_config
install_tmux_config
install_zsh_config
