source $HOME/dotfiles/bash/.bashrc
source $HOME/dotfiles/bash/.bash_aliases

# disable zsh warning
# https://support.apple.com/kb/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=20000

# set ghostty config editor
export EDITOR="vim"
