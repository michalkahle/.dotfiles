# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignorespace:erasedups
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file, don't overwrite it
shopt -s histappend
# check and update the values of LINES and COLUMNS after each command.
shopt -s checkwinsize
# "**" will match in subdirectories recursively.
shopt -s globstar

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|linux) PS1='\[\033[07;32m\]\w\$\[\033[00m\] ';;
    *)PS1='\u@\h:\w\$ ';;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias colordiff='colordiff --unified'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# disable ctrl-s terminal freezing
stty -ixon

# aliases
alias ll='ls -lFh'
alias la='ls -Ah'
alias lla='ls -AlFh'
alias l='ls -CF'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gl="git log --graph --pretty=format:'%C(yellow)%h%C(red)%d %Creset%s %C(green)(%cr) %C(blue)%an%Creset'"
alias gd='git diff'
alias gpr='git pull --rebase'
alias gpu='git push'


if [ -f ~/miniconda3/etc/profile.d/conda.sh ]; then
    . ~/miniconda3/etc/profile.d/conda.sh
elif [ -f ~/conda/etc/profile.d/conda.sh ]; then
    . ~/conda/etc/profile.d/conda.sh
fi

#__conda_setup="$('/home/michal/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#fi
#unset __conda_setup

# remove games from PATH
PATH=${PATH/":/usr/games"/""}
PATH=${PATH/":/usr/local/games"/""}
# PATH="$HOME/.local/bin:$PATH"
