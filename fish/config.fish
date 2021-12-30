set fish_greeting ""
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export DOTFILES=$HOME/.dotfiles

set -gx TERM xterm-256color


alias lzg "lazygit"
alias lzd "lazydocker"

# some more ls aliases
alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'

starship init fish | source

# set up rust env variables
set -Up fish_user_paths ~/.cargo/bin
