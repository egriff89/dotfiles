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
set git "git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
abbr -a dtf "$git"
abbr -a dtfs "$git status"
abbr -a dtfa "$git add"
abbr -a dtfp "$git push"
abbr -a dtfc "$git commit -m"
abbr -a dtfd "$git diff"

# Git abbreviations
abbr -a gadd 'git add'
abbr -a gcm 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gpl 'git pull'
abbr -a gps 'git push'
abbr -a gst 'git status'
abbr -a gsw 'git switch'
