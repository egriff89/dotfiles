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

abbr -a ff fastfetch

# @fish-lsp-disable-next-line 4004
function ls -a dir
    eza --icons --color=always --group-directories-first $dir
end

# @fish-lsp-disable-next-line 4004
function la -a dir
    eza -lag --icons --color=always --group-directories-first --header $dir
end

# @fish-lsp-disable-next-line 4004
function ll -a dir
    eza -lg --icons --color=always --group-directories-first --header $dir
end
