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
    #[ -d "~/.config/alacritty" ] &&
    weztermconfig="$HOME/.config/wezterm"
    rm -rf $weztermconfig
    ln -s $DOTFILES/wezterm $weztermconfig
}

link_rustfmt() {
    #[ -d "~/.config/alacritty" ] &&
    rustfmt="$HOME/.config/rustfmt"
    rm -rf $rustfmt
    ln -s $DOTFILES/rustfmt $rustfmt
}

link_nvim
link_tmux
link_wezterm
link_rustfmt
