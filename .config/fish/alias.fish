#!/usr/bin/env fish

# general
# alias sudo='doas'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# listing files
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -alh'

# editors
alias vim='nvim'

# python
alias py311='/usr/bin/python3.11'       # Python 3.11 (AUR)
alias py312='/usr/bin/python3.12'       # Python 3.12 alpha (AUR)
alias pyv311='py311 -m venv'            # Create Python 3.11 virtual environment
alias pyv312='py312 -m venv'            # Create Python 3.12 virtual environment
alias pyvenv='/usr/bin/python -m venv'  # Create virtual environment with system Python version

# pacman / paru
alias pacsyu='sudo pacman -Syu'                 # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'               # Refresh pkglist & update standard pkgs
alias pacss='pacman -Ss'                        # Search for standard pkgs
alias parssa='paru -Ssa'                        # Search for AUR pkgs
alias parsua='paru -Sua'                        # update only AUR pkgs
alias parsyu='paru -Syu'                        # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'   # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages

# flatpak
alias fps='flatpak search'
alias fpin='flatpak install'
alias fpup='flatpak update'
alias fpun='flatpak uninstall'
alias fpls='flatpak list'
alias fpinfo='flatpak info'

# rclone
alias rmount='rclone mount'

# other package managers
alias pn='pnpm'               # PNPM
alias pni='pn install'        # install Node.js module
alias pnu='pn uninstall'      # uninstall Node.js module
alias pipi='pip install'      # install Python module
alias pipu='pip uninstall'    # uninstall Python module
alias pipl='pip list'         # list installed Python modules
alias pipfr='pip freeze'      # list installed Python modules (requirements.txt format)

# tar compression
alias tarxz='tar -cvJf'     # Create archive with xz compression (*.tar.xz)
alias tarbz='tar -cvjf'     # Create archive with bzip2 compression (*.tar.bz2)
alias targz='tar -cvzf'     # Create archive with gzip compression (*.tar.gz)
alias tarcmp='tar -cvZf'    # Create archive using compress (*.tar.Z)

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Dotfiles bare repo alias
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
