# ~/.bashrc
# Author: Eric Griffith
# http://www.gitlab.com/egriff89

# Some portions borrowed from the following repos:
#   https://gitlab.com/dwt1/dotfiles

# Enable Blesh - Bash syntax highlighting, autocompletion, etc
# https://github.com/akinomyoga/ble.sh/wiki
[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

### Setting XDG environment
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

### EXPORTS
export TERM="xterm-256color"                # proper terminal colors
export HISTCONTROL=ignoredups:erasedups     # no duplicate entries in history
export EDITOR="nvim"
export VISUAL="nvim"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

### Set MANPAGER
### Uncomment only one of these. MANPAGER defaults to "less" if not specified.

## "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

### Miscellaneous exports
export GOPATH="$XDG_DATA_HOME"/go
export LEIN_HOME="$XDG_DATA_HOME"/lein
export GNUPG_HOME="$XDG_DATA_HOME"/gnupg
export NIMBLE_DIR="$XDG_DATA_HOME"/nimble
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export OPAMROOT="$XDG_DATA_HOME"/opam
export PYTHONSTARTUP="/etc/python/pythonrc"

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# Haskell / GHC
export GHCUP_USE_XDG_DIRS=true
export STACK_XDG=1
export STACK_ROOT="$XDG_DATA_HOME"/stack

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### ALIASES
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -alh'
alias nv='/usr/bin/nvim'

# python
alias py312='python3.12'                # Python 3.12 (AUR)
alias pyv312='py312 -m venv'            # Create Python 3.12 virtual environment
alias pyvenv='/usr/bin/python -m venv'  # Create virtual environment with system Python version

# pacman
alias pacs='sudo pacman -S'                      # install standard pkgs
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # refresh pkglist & update standard pkgs
alias pacss='pacman -Ss'                         # search for standard pkgs
alias parsa='paru -Sa'                           # Install AUR pkgs
alias parssa='paru -Ssa'                         # search for AUR pkgs
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# other package managers
alias pn='pnpm'               # PNPM
alias pni='pn install'        # install Node.js module (from package.json)
alias pna='pn add'            # install a Node.js module and its dependencies
alias pnu='pn uninstall'      # uninstall Node.js module
alias pipi='pip install'      # install Python module
alias pipu='pip uninstall'    # uninstall Python module
alias pipl='pip list'         # list installed Python modules
alias pipfr='pip freeze'      # list installed Python modules (requirements.txt format)

# flatpak
alias fps='flatpak search'                                                      
alias fpin='flatpak install'                                                    
alias fpup='flatpak update'                                                     
alias fpun='flatpak uninstall'                                                  
alias fpls='flatpak list'                                                       
alias fpinfo='flatpak info'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

### other system utilities
if [ $(pacman -Qq | grep 'bat-extras') ]; then
    alias diff='batdiff'
fi

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

if [ -d "$HOME/.cargo/bin" ] ;
  then PATH="$HOME/.cargo/bin:$PATH"
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

# Git aliases
alias gits='git status'
alias gita='git add'
alias gitc='git commit'
alias gitps='git push'
alias gitpl='git pull'
alias gitsh='git stash'

# Start Starship prompt
eval "$(starship init bash)"
