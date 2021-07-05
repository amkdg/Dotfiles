# https://github.com/amkdg/Dotfiles

# Aliases
alias fuck="sudo !!"

alias la="ls -a"
alias ..="cd .."

alias desktop="cd ~/Desktop"
alias downloads="cd ~/Downloads"
alias documents="cd ~/Documents"
alias developer="cd ~/Developer"

alias reload="clear; exec ${SHELL} -l"

pfetch

# Use tmux
if [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s main
fi

# Use starship shell
eval "$(starship init zsh)"