# ~/.bashrc
# Author: Eric Griffith
# http://www.gitlab.com/egriff89

# Some portions borrowed from the following repos:
#   https://gitlab.com/dwt1/dotfiles


### EXPORTS
export TERM="xterm-256color"                # proper terminal colors
export HISTCONTROL=ignoredups:erasedups     # no duplicate entries in history
export EDITOR="nvim"
export VISUAL="nvim"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### ALIASES
alias ls='ls -a --color=auto'
alias ll='ls -lh'
alias la='ls -alh'
alias vim='nvim'

# docker
alias docker='sudo docker'
alias dockerc='sudo docker-compose'

# pacman
alias pacsyu='sudo pacman -Syu'                     # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                   # refresh pkglist & update standard pkgs
alias parsua='paru -Sua --noconfirm'                # update only AUR pkgs
alias parsyu='paru -Syu --noconfirm'                # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'       # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'    # remove orphaned packages

# other package managers
alias pn='pnpm'               # PNPM
alias pni='pn install'        # install Node.js module
alias pnu='pn uninstall'      # uninstall Node.js module
alias pipi='pip install'      # install Python module
alias pipu='pip uninstall'    # uninstall Python module
alias pipl='pip list'         # list installed Python modules
alias pipfr='pip freeze'      # list installed Python modules (requirements.txt format)

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


### PROMPT
# Commented out when using Starship
# PS1='[\u@\h \W]\$ '

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/util" ] ;
  then PATH="$HOME/.local/util:$PATH"
fi

# DOOM Emacs
if [ -d "$HOME/.emacs.d/bin" ] ;
  then PATH="$HOME/.emacs.d/bin:$PATH"
fi

## CHANGE TITLE OF TERMINALS
case ${TERM} in
    xterm*|Eterm*|alacritty|konsole)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
    screen*)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
        ;;
esac

### SHOPT
shopt -s autocd         # change to named directory
shopt -s cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control

# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Alias for dotfiles bare repo
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dtfs='dtf status'
alias dtfa='dtf add'
alias dtfp='dtf push'
alias dtfc='dtf commit'

# Start Starship prompt
eval "$(starship init bash)"
