#!/usr/bin/env fish

# editors
abbr -a nv nvim
abbr -a zd zeditor

# pacman
abbr -a unlock 'sudo rm /var/lib/pacman/db.lck' # remove pacman lock
abbr -a cleanup 'sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages
abbr -a orphan 'pacman -Qtdq' # list orphaned packages

# PNPM
abbr -a pn pnpm
abbr -a pnsu 'pnpm self-update' # Self-update PNPM
abbr -a pnupg 'pnpm update -g' # Update all global Node.js modules

# Dotfiles bare repo alias
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dtfs='dtf status'
alias dtfa='dtf add'
alias dtfp='dtf push'
alias dtfc='dtf commit'

# Git abbreviations
abbr -a gadd 'git add'
abbr -a gcm 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gpl 'git pull'
abbr -a gps 'git push'
abbr -a gst 'git status'
abbr -a gsw 'git switch'
