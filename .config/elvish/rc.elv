# ~/.config/elvish/rc.elv
# Author: Eric Griffith
# https://www.gitlab.com/egriff89

# Conversion of my Fish config with parts borrowed from:
# https://github.com/zzamboni/dot-elvish/blob/master/rc.elv

# Install modules
use epm
epm:install &silent-if-installed github.com/zzamboni/elvish-modules

# Import modules
use github.com/zzamboni/elvish-modules/alias
use path
use direnv

### Set XDG environment
set E:XDG_DATA_HOME   = $E:HOME/.local/share
set E:XDG_CONFIG_HOME = $E:HOME/.config
set E:XDG_STATE_HOME  = $E:HOME/.local/state
set E:XDG_CACHE_HOME  = $E:HOME/.cache

### EXPORTS
set E:EDITOR = nvim
set E:VISUAL = nvim
set E:DOCKER_HOST = unix://$E:XDG_RUNTIME_DIR/docker.sock
set E:DOOMDIR     = $E:XDG_CONFIG_HOME/doom
set E:WINEPREFIX  = $E:XDG_DATA_HOME/wine
set E:MANPAGER    = less

# Languages
set E:BUN_INSTALL = $E:HOME/.bun
set E:GOPATH = $E:XDG_DATA_HOME/go
set E:LEIN_HOME = $E:XDG_DATA_HOME/lein
set E:RUSTUP_HOME = $E:XDG_DATA_HOME/rustup
set E:CARGO_HOME  = $E:XDG_DATA_HOME/cargo
set E:GHCUP_USE_XDG_DIRS = true
set E:STACK_XDG  = 1
set E:STACK_ROOT = $E:XDG_DATA_HOME/stack
set E:OPAMROOT = $E:XDG_DATA_HOME/opam
set E:PNPM_HOME = $E:XDG_DATA_HOME/pnpm
set E:MISE_DATA_DIR = $E:XDG_DATA_HOME/mise
set E:MISE_CACHE_DIR = $E:XDG_CACHE_HOME/mise
set E:MISE_CONFIG_DIR = $E:XDG_CONFIG_HOME/mise

# Tools
set E:GNUPGHOME = $E:XDG_DATA_HOME/gnupg
set E:NPM_CONFIG_USERCONFIG  = $E:XDG_CONFIG_HOME/npm/npmrc
set E:NUGET_PACKAGES = $E:XDG_CACHE_HOME/NuGetPackages

### Path stuff
# Optional paths, add only if they exist
var optpaths = [
    $E:PNPM_HOME
    $E:GOPATH/bin
    $E:BUN_INSTALL
    $E:HOME/.local/bin
    $E:HOME/.local/util
]
var optpaths-filtered = [(each {|p|
    if (path:is-dir $p) { put $p }
} $optpaths)]

set paths = [
    $@optpaths-filtered
    /usr/local/bin
    /usr/local/sbin
    /usr/sbin
    /sbin
    /usr/bin
    /bin
]

# Sanity check: warn when non-existing directories in $paths when opening a new shell
each { |p|
    if (not (path:is-dir &follow-symlink $p)) {
        echo (styled "Warning: directory "$p" in $paths not longer exists." red)
    }
} $paths

### Aliases
alias:new ls eza --icons --group-directories-first
alias:new ll eza -lg --icons --group-directories-first
alias:new la eza -lag --icons --group-directories-first

alias:new nv /usr/bin/nvim
alias:new zd /usr/bin/zeditor

alias:new grep grep --color=auto

# Pacman
alias:new unlock sudo rm /var/lib/pacman/db.lck
alias:new cleanup sudo pacman -Rns (pacman -Qtdq)


# PNPM
alias:new pn pnpm
alias:new pnsu pnpm self-update
alias:new pnupg pnpm update -g


### Other utilities
if ?(pacman -Qq | grep -q 'bat-extras') {
    alias:new diff batdiff
    alias:new man batman
}

# get fastest mirrors
alias:new mirror sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
alias:new mirrord sudo reflector --country "United States" --protocol https --fastest 30 --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist
alias:new mirrors sudo reflector --country "United States" --protocol https --fastest 30 --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist
alias:new mirrora sudo reflector --country "United States" --protocol https --fastest 30 --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist

# Dotfiles bare repo
alias:new dtf git --git-dir=$E:HOME/.dotfiles --work-tree=$E:HOME
alias:new dtfs git --git-dir=$E:HOME/.dotfiles --work-tree=$E:HOME status
alias:new dtfa git --git-dir=$E:HOME/.dotfiles --work-tree=$E:HOME add
alias:new dtfp git --git-dir=$E:HOME/.dotfiles --work-tree=$E:HOME push
alias:new dtfc git --git-dir=$E:HOME/.dotfiles --work-tree=$E:HOME commit

# Git
alias:new gits git status
alias:new gita git add
alias:new gitc git commit
alias:new gitps git push
alias:new gitco git checkout
alias:new gitsw git switch

if (eq (which mise) $E:XDG_DATA_HOME/mise) {
    eval (mise activate fish | slurp)
}

### Init Starship and Zoxide
eval (starship init elvish | slurp)
eval (zoxide init elvish | slurp)