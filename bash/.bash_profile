source $HOME/dotfiles/bash/.bashrc
source $HOME/dotfiles/bash/.bash_aliases

# disable zsh warning
# https://support.apple.com/kb/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

# gitignore.io
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
