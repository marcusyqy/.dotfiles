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


link_wezterm() {
    weztermconfig="$HOME/.config/wezterm"
    rm -rf $weztermconfig
    ln -s $DOTFILES/wezterm $weztermconfig
}

link_wezterm() {
    pipconfig="$HOME/.config/pip"
    rm -rf $pipconfig
    ln -s $DOTFILES/pip $pipconfig
}

link_ghostty() {
    ghostty="$HOME/.config/ghostty"
    rm -rf $ghostty
    ln -s $DOTFILES/ghostty $ghostty
}

link_nvim
link_tmux
link_wezterm
link_pip
link_ghostty
