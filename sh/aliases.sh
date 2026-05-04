# Shared aliases for interactive shells.

if command ls --color=auto / >/dev/null 2>&1; then
  alias ls='ls --color=auto'
  alias ll='ls -alHF --color=auto'
  alias la='ls -A --color=auto'
  alias l='ls -CF --color=auto'
else
  alias ls='ls -G'
  alias ll='ls -alHF'
  alias la='ls -A'
  alias l='ls -CF'
fi

alias ccc='claude --allow-dangerously-skip-permissions'
alias cccc='claude --allow-dangerously-skip-permissions -c'
