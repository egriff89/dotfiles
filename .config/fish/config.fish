# ~/.config/fish/config.fish
# Author: Eric Griffith
# http://www.gitlab.com/egriff89

# Some portions borrowed from the following repos:
#   https://gitlab.com/dwt1/dotfiles

 ### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths \
    $HOME/.cargo/bin \
    $HOME/.local/bin \
    $HOME/.local/util \
    $HOME/.emacs.d/bin \
    $HOME/.nimble/bin \
    $HOME/.luarocks/bin \
    $fish_user_paths

### EXPORT ###
set fish_greeting           # Supresses fish's intro message
set TERM "xterm-256color"   # Sets the terminal type
set EDITOR "nvim"
set VISUAL "nvim"
set DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock

### Set manpager
if test -f /usr/bin/batman
    set -x MANPAGER "batman"
else
    set -x MANPAGER "most"
end

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
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path $PNPM_HOME
# pnpm end

### ALIASES ###

if test -f $HOME/.config/fish/alias.fish
    source $HOME/.config/fish/alias.fish
end

# Direnv
direnv hook fish | source

### INIT STARSHIP PROMPT
starship init fish | source
