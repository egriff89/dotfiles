#!/usr/bin/env fish

# listing files
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -lg --icons --color=always --group-directories-first --header'
alias la='eza -lag --icons --color=always --group-directories-first --header'

# editors
alias nv='/usr/bin/nvim'
alias zd='/usr/bin/zeditor'

# pacman
alias unlock='sudo rm /var/lib/pacman/db.lck'   # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages
alias orphan='pacman -Qtdq'                     # list orphaned packages

# PNPM
alias pn='pnpm'
alias pnsu='pn self-update' # Self-update PNPM
alias pnupg='pn update -g'  # Update all global Node.js modules

### other system utilities
alias grep='grep --color=auto'

if test (pacman -Qq | grep 'bat-extras')
    alias diff='batdiff'
    alias man='batman'
end

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
