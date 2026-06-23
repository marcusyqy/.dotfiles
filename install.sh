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
    ghosttyconfig="$HOME/.config/ghostty"
    rm -rf $ghosttyconfig
    ln -s $DOTFILES/ghostty $ghosttyconfig
}

link_vimrc() {
    rm $HOME/.vimrc
    ln -s $DOTFILES/.vimrc $HOME/.vimrc
}


link_neovide() {
    rm -rf $HOME/.config/neovide
    ln -s $DOTFILES/neovide $HOME/.config/neovide
}

link_zshrc() {
    rm $HOME/.zshrc
    ln -s $DOTFILES/.zshrc $HOME/.zshrc
}

link_bashrc() {
    rm $HOME/.bashrc
    ln -s $DOTFILES/.bashrc $HOME/.bashrc
}

link_nvim
link_tmux
link_wezterm
link_ghostty
link_vimrc
link_neovide
link_zshrc
link_bashrc

