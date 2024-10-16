# ~/.config/fish/config.fish
# Author: Eric Griffith
# http://www.gitlab.com/egriff89

# Some portions borrowed from the following repos:
#   https://gitlab.com/dwt1/dotfiles

### Setting XDG environment
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

 ### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths \
    $XDG_DATA_HOME/cargo/bin \
    $XDG_DATA_HOME/go/bin \
    $XDG_CONFIG_HOME/emacs/bin \
    $XDG_CACHE_HOME/rebar3/bin \
    $HOME/.local/bin \
    $HOME/.local/util \
    $HOME/.luarocks/bin \
    $HOME/.nimble/bin \
    $fish_user_paths

### EXPORT ###
set fish_greeting           # Supresses fish's intro message
set TERM "xterm-256color"   # Sets the terminal type
set EDITOR "nvim"
set VISUAL "nvim"
set DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock

set -gx DOOMDIR "$XDG_CONFIG_HOME"/doom
set -gx WINEPREFIX "$XDG_DATA_HOME"/wine

### Set MANPAGER
## Uncomment only one. MANPAGER defaults to "less" if nothing is specified. 

## "bat" as manpager
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

## "less" as manpager
set -x MANPAGER "less"

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# pnpm
set -gx PNPM_HOME "$XDG_DATA_HOME/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

### Miscellaneous exports
set -gx GOPATH "$XDG_DATA_HOME"/go
set -gx LEIN_HOME "$XDG_DATA_HOME"/lein
set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set -gx NUGET_PACKAGES "$XDG_CACHE_HOME"/NuGetPackages
set -gx OPAMROOT "$XDG_DATA_HOME"/opam
set -gx KERL_CONFIGURE_OPTIONS "--with-odbc=/var/lib/pacman/local/unixodbc-2.3.12-1" # use ODBC (unixodbc)
# set -gx KERL_CONFIGURE_OPTIONS "--without-odbc" # do not use ODBC
set -gx ASDF_DATA_DIR "$HOME"/.local/share/asdf # XDG vars don't work apparently
set -gx PIPENV_VENV_IN_PROJECT 1

# Rust
set -gx RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
        
# Haskell / GHC
set -gx GHCUP_USE_XDG_DIRS true
set -gx STACK_XDG 1
set -gx STACK_ROOT "$XDG_DATA_HOME"/stack

### ALIASES ###
if test -f $HOME/.config/fish/alias.fish
    source $HOME/.config/fish/alias.fish
end

# Direnv
direnv hook fish | source

## init asdf (https://asdf-vm.com/)
if test -d /opt/asdf-vm
    source /opt/asdf-vm/asdf.fish
end

# opam
set OPAM (which opam)
if test -f $OPAM
    eval ($OPAM env)
end

### INIT STARSHIP PROMPT
starship init fish | source

