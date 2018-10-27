#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z "$PS1" ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='\u@\h:\w\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '

# >>> BEGIN ADDED BY CNCHI INSTALLER
# BROWSER=/usr/bin/chromium
# EDITOR=/usr/bin/nano
# <<< END ADDED BY CNCHI INSTALLER
PAGER=less
EDITOR=/usr/bin/vi
BROWSER=/usr/bin/firefox
set -o vi

PATH=$PATH:/home/kedwin/bin
umask 077

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#alias l='ls -hal'
#alias df='df -h'
HISTSIZE=-1
HISTFILESIZE=-1
#HISTCONTROL=ignoredups
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
shopt -s cdspell
shopt -s autocd
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
#alias veracrypt='veracrypt -t ' 

if [[ "$TERMINOLOGY" -eq "1" ]]; then
	PATH="$HOME/.Pokemon-Terminal:"$PATH""
	pokemon 
fi

