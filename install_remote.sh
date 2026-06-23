#!/bin/sh

set -eu

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 user@host"
    exit 1
fi

if [ -z "${DOTFILES:-}" ]; then
    echo "DOTFILES is not set"
    exit 1
fi

host="$1"

copy_nvim() {
    ssh "$host" 'mkdir -p ~/.config/nvim'
    scp -r "$DOTFILES/nvim/." "$host:~/.config/nvim/"
}

copy_tmux() {
    scp "$DOTFILES/tmux/.tmux.conf" "$host:~/.tmux.conf"
}

copy_vimrc() {
    scp "$DOTFILES/.vimrc" "$host:~/.vimrc"
}

copy_zshrc() {
    scp "$DOTFILES/.zshrc" "$host:~/.zshrc"
}

copy_bashrc() {
    scp "$DOTFILES/.bashrc" "$host:~/.bashrc"
}

copy_nvim
copy_tmux
copy_vimrc
copy_zshrc
copy_bashrc
