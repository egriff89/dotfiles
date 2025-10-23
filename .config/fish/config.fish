# ~/.config/fish/config.fish
# Author: Eric Griffith
# http://www.gitlab.com/egriff89

### Setting XDG environment
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -gx fish_user_paths \
    $XDG_CACHE_HOME \
    $XDG_CONFIG_HOME \
    $XDG_DATA_HOME \
    $XDG_CONFIG_HOME/emacs/bin \
    $HOME/.local/bin \
    $HOME/.local/util \
    $HOME/.luarocks/bin

### EXPORT ###
set fish_greeting # Supresses fish's intro message
set EDITOR nvim
set VISUAL nvim
set DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock

set -x MANPAGER less
set -gx DOOMDIR "$XDG_CONFIG_HOME"/doom
set -gx WINEPREFIX "$XDG_DATA_HOME"/wine

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# Fcitx5
set -gx XMODIFIERS @im=fcitx

# pnpm
set -gx PNPM_HOME "$XDG_DATA_HOME/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

### Miscellaneous exports
set -gx GOPATH "$XDG_DATA_HOME"/go
fish_add_path "$GOPATH"/bin

set -gx LEIN_HOME "$XDG_DATA_HOME"/lein
set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -gx NUGET_PACKAGES "$XDG_CACHE_HOME"/NuGetPackages
set -gx OPAMROOT "$XDG_DATA_HOME"/opam
set -gx ODIN_ROOT "$HOME"/dev/repos/Odin
set -gx ANSIBLE_HOME "$XDG_DATA_HOME"/ansible

# Rust
set -gx RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
fish_add_path "$CARGO_HOME"/bin

# Mise - https://mise.jdx.dev/
set MISE (which mise)
if test -f $MISE
    eval ($MISE activate fish | source)

    # Env vars
    set -gx MISE_DATA_DIR "$XDG_DATA_HOME"/mise
    set -gx MISE_CACHE_DIR "$XDG_CACHE_HOME"/mise
    set -gx MISE_CONFIG_DIR "$XDG_CONFIG_HOME"/mise

    # opam
    set OPAM (which opam)
    if test -f $OPAM
        eval ($OPAM env)
    end
end

### ABBREVIATIONS / ALIASES ###
source $XDG_CONFIG_HOME/fish/abbrs.fish

direnv hook fish | source
zoxide init fish | source
starship init fish | source
