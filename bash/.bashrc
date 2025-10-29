# External git prompt script (for showing git status in PS1)
source $HOME/dotfiles/bash/.bash_git


######## Styles ########

# https://github.com/mkasberg/dotfiles/blob/b496e5e5fd6e490708fc1b56c088952b3ae874bc/dot_bashrc#L71

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=

if [ -n "$force_color_prompt" ]; then
    color_prompt=yes
elif [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
else
	color_prompt=
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
    PS1='${debian_chroot:+($debian_chroot)}\u \w$(__git_ps1 " (%s)")\n\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

######## title ########
__set_title() {
  # 비활성화 스위치
  [ -n "$NO_TITLE" ] && return

  # 지원하지 않는 터미널(리눅스 콘솔, dumb 등) 걸러내기
  case "$TERM" in
    linux|dumb|'') return ;;
  esac

  # 보낼 실제 OSC payload
  # 기본은 window title만 바꾸는 OSC 2를 사용
  local title="$1"
  local osc_start="\033]2;"
  local osc_end="\007"

  # tmux나 screen 안에서는 DCS 래핑이 필요
  if [ -n "$TMUX" ] || [ "$TERM" = "screen" ] || [[ "$TERM" = screen.* ]]; then
    # tmux: ESC P tmux; ESC ESC ]2;title BEL ESC \
    # screen: ESC P ESC ]2;title BEL ESC \
    if [ -n "$TMUX" ]; then
      printf '\033Ptmux;\033%s%s\033\\' "$osc_start" "${title}${osc_end}"
    else
      printf '\033P%s%s\033\\' "$osc_start" "${title}${osc_end}"
    fi
  else
    # 일반 xterm 호환 터미널
    printf '%b' "${osc_start}${title}${osc_end}"
  fi
}

# Bash에서는 PROMPT_COMMAND에서 호출
# 제목 생성 함수
__title_from_context() {
  # 경로에 따른 folder 이름 결정
  local base
  if [ "$PWD" = "$HOME" ]; then
    base="~"
  elif [ "$PWD" = "/" ]; then
    base="/"
  else
    base="${PWD##*/}"
  fi
  t="${USER}: ${base}"
  __set_title "$t"
}

# 기존 PROMPT_COMMAND 보존하며 추가
case "$PROMPT_COMMAND" in
  *__title_from_context* ) ;;
  '' ) PROMPT_COMMAND="__title_from_context" ;;
  * ) PROMPT_COMMAND="__title_from_context; ${PROMPT_COMMAND}" ;;
esac


######## mise ########
eval "$(~/.local/bin/mise activate bash)"

######## Functions ########
# gitignore.io
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}
