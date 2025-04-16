######## Styles ########

# bash_git for __git_ps1()
source $HOME/dotfiles/.bash_git

# https://github.com/mkasberg/dotfiles/blob/b496e5e5fd6e490708fc1b56c088952b3ae874bc/dot_bashrc#L71

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # Default color prompt:
    #PS1='$${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    CYAN=`tput setaf 45`;
    RED=`tput setaf 1`;
    YELLOW=`tput setaf 11`;
    GREEN=`tput setaf 34`;
    BLUE=`tput setaf 27`;
    MAGENTA=`tput setaf 213`;
    WHITE=`tput setaf 7`;
    RESET=`tput sgr0`;
    BOLD=`tput bold`;
    PS1='\[${CYAN}\]${debian_chroot:+($debian_chroot)}\u\[${RESET}${BOLD}\] \[${CYAN}\]\w\[${RESET}\]$(__git_ps1 " (\[${YELLOW}\]%s\[${RESET}\])")\n\[${BOLD}\]\$\[${RESET}\] '
else
    # Modified to support git status in PS1.
    # Also modified by Mike to function better.
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u:\w$(__git_ps1 " (%s)")\n\$ '
fi
unset color_prompt force_color_prompt

########

# disable zsh warning
# https://support.apple.com/kb/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

# gitignore.io
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}

alias ll='ls -alH --color=auto'
