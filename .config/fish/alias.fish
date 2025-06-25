#!/usr/bin/env fish

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# listing files
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -lg --icons --color=always --group-directories-first --header'
alias la='eza -lag --icons --color=always --group-directories-first --header'

# editors
alias nv='/usr/bin/nvim'
alias zd='/usr/bin/zeditor'

# pacman / paru
alias pacs='sudo pacman -S' # Install standard pkgs
alias pacsyu='sudo pacman -Syu' # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu' # Refresh pkglist & update standard pkgs
alias pacss='pacman -Ss' # Search for standard pkgs
alias pacqi='pacman -Qi' # Show info for installed pkg
alias pacqs='pacman -Qs' # Query for local pkgs
alias pacq='pacman -Q' # Show installed pkgs w/ version number
alias pacqm='pacman -Qm' # Show installed foreign pkgs w/ version number (AUR)
alias parsa='paru -Sa' # Install AUR pkgs
alias parssa='paru -Ssa' # Search for AUR pkgs
alias parsua='paru -Sua' # update only AUR pkgs
alias parsyu='paru -Syu' # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck' # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages

# PNPM
alias pn='pnpm'
alias pnsu='pn self-update' # Self-update PNPM
alias pnupg='pn update -g' # Update all global Node.js modules

# flatpak
alias fp='flatpak'
alias fpup='flatpak update'
alias fpin='flatpak install'
alias fpun='flatpak uninstall'

### other system utilities
alias grep='grep --color=auto'

if test (pacman -Qq | grep 'bat-extras')
    alias diff='batdiff'
    alias man='batman'
end

# tar compression
alias tarxz='tar -cvJf' # Create archive with xz compression (*.tar.xz)
alias tarbz='tar -cvjf' # Create archive with bzip2 compression (*.tar.bz2)
alias targz='tar -cvzf' # Create archive with gzip compression (*.tar.gz)
alias tarcmp='tar -cvZf' # Create archive using compress (*.tar.Z)

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
