#!/usr/bin/env fish

# editors
alias nv='/usr/bin/nvim'
alias zd='/usr/bin/zeditor'

# pacman
alias unlock='sudo rm /var/lib/pacman/db.lck' # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages
alias orphan='pacman -Qtdq' # list orphaned packages

# PNPM
alias pn='pnpm'
alias pnsu='pn self-update' # Self-update PNPM
alias pnupg='pn update -g' # Update all global Node.js modules

### other system utilities
alias grep='grep --color=auto'

# Dotfiles bare repo alias
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dtfs='dtf status'
alias dtfa='dtf add'
alias dtfp='dtf push'
alias dtfc='dtf commit'
