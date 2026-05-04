# disable zsh warning
# https://support.apple.com/kb/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

# Shared login environment.
. "$HOME/dotfiles/sh/env.sh"

# Homebrew
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
