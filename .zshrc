export CLICOLOR=1
# export PS1=$'%n@%m:\e[0;36m%~\e[0m$ '
export PROMPT='%n@%m:%F{cyan}%~%f$ '
export EDITOR='vim'
set -o emacs

alias ll='ls -la'
alias l='ls -la'
bindkey -e

alias python='python3'

bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[3~" delete-char

