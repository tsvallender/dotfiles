PAGER="less -r"
EDITOR="nvim"
VISUAL="nvim"
PATH=$HOME/bin:$HOME/.my_config/bin:$PATH
shopt -s checkwinsize
XDG_STATE_HOME=$HOME/.state
export PSPG_CONF="$HOME/.config/pspg"

LC_ALL="en_GB.UTF-8"

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/openssl-1.0.2u/lib
XDG_CURRENT_DESKTOP=sway
XDG_DOWNLOAD_DIR=$HOME/downloads
XDG_PICTURES_DIR=$HOME/img
HYPRSHOT_DIR=$XDG_PICTURES_DIR/screenshots

# Sane defaults for history
HISTFILE=$XDG_STATE_HOME/.bash_history
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups # Ubuntu default is ignoreboth
shopt -s histappend  # In Ubuntu this is already set by default
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

shopt -s histappend

# Prompt setup
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
source ~/bin/git_prompt.sh

BLUE='\033[0;34m'
CLEAR='\033[0m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BOLD='\033[01m'

PS1="\n\n[$GREEN\\]\h$CLEAR\\]] [$BLUE\\]\w$CLEAR\\]]"
PS1+=' $(__git_ps1 [$YELLOW%s$CLEAR]) \n'
PS1+=" \[$BOLD\]"
trap 'printf "\033[0m" >&2' DEBUG

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

eval "$(~/.rbenv/bin/rbenv init - bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
