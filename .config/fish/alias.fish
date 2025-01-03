#!/usr/bin/env fish

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# listing files
alias ls='eza --icons --group-directories-first'
alias ll='eza -lg --icons --group-directories-first'
alias la='eza -lag --icons --group-directories-first'

# editors
alias nv='/usr/bin/nvim'

# python
alias pyvenv='/usr/bin/python -m venv'  # Create virtual environment with system Python version

alias mips="java -jar $HOME/.local/bin/Mars4_5.jar"

# pacman / paru
alias pacs='sudo pacman -S'                     # Install standard pkgs
alias pacsyu='sudo pacman -Syu'                 # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'               # Refresh pkglist & update standard pkgs
alias pacss='pacman -Ss'                        # Search for standard pkgs
alias pacqi='pacman -Qi'                        # Show info for installed pkg
alias pacqs='pacman -Qs'                        # Query for local pkgs
alias pacq='pacman -Q'                          # Show installed pkgs w/ version number
alias pacqm='pacman -Qm'                        # Show installed foreign pkgs w/ version number (AUR)
alias parsa='paru -Sa'                          # Install AUR pkgs
alias parssa='paru -Ssa'                        # Search for AUR pkgs
alias parsua='paru -Sua'                        # update only AUR pkgs
alias parsyu='paru -Syu'                        # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'   # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages

### other system utilities
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

if test (pacman -Qq | grep 'bat-extras')
    alias diff='batdiff'
    alias man='batman'
end

### typo aliases
alias clera='clear'
alias cleare='clear'
alias claer='clear'

# flatpak
alias fps='flatpak search'
alias fpin='flatpak install'
alias fpup='flatpak update'
alias fpun='flatpak uninstall'
alias fpls='flatpak list'
alias fpinfo='flatpak info'

# other package managers
alias pn='pnpm'               # PNPM
alias pni='pn install'        # install Node.js module (from package.json)
alias pna='pn add'            # install a module and its dependencies
alias pnu='pn uninstall'      # uninstall Node.js module
alias pnsu='pn self-update'   # Self-update PNPM
alias pnupg='pn update -g'    # Update all global Node.js modules

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
alias gitco='git checkout'
alias gitsw='git switch'

