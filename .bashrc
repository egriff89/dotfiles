#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="~/.emacs.d/bin:$PATH"

alias ls='ls -a --color=auto'
alias ll='ls -lh'
alias la='ls -alh'
alias emacs="emacsclient -c -a 'emacs'"

PS1='[\u@\h \W]\$ '

# Alias for dotfiles bare repo
alias gitcfg='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# Start Starship prompt
eval "$(starship init bash)"
