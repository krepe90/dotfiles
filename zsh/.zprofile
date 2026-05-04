# Shared login environment.
. "$HOME/dotfiles/sh/env.sh"

# brew
if [[ "$(arch)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi
