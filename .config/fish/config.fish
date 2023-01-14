# ~/.config/fish/config.fish
# Author: Eric Griffith
# http://www.gitlab.com/egriff89

# Some portions borrowed from the following repos:
#   https://gitlab.com/dwt1/dotfiles

 ### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.local/util $HOME/.emacs.d/bin $fish_user_paths


### EXPORT ###
set fish_greeting           # Supresses fish's intro message
set TERM "xterm-256color"   # Sets the terminal type
set EDITOR "nvim"
set VISUAL "nvim"

### "most" as manpager
set -x MANPAGER "most"

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# pnpm
set -x PNPM_HOME "$HOME/.local/share/pnpm"
set -U PATH "$PNPM_HOME" $PATH
# pnpm end

### ALIASES ###

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# listing files
alias ls='ls -a --color=auto'
alias ll='ls -lh'
alias la='ls -alh'

# editors
alias vim='nvim'
alias code='vscodium'

# docker
alias docker='sudo docker'
alias dockerc='sudo docker-compose'

# python
alias py311='python3.11'

# perl
set -x PATH "$HOME/perl5/bin" $PATH
set -q PERL5LIB; and set -x PERL5LIB "$HOME/perl5/lib/perl5":$PERL5LIB;
set -q PERL5LIB; or set -x PERL5LIB "$HOME/perl5/lib/perl5";
set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT "$HOME/perl5":$PERL_LOCAL_LIB_ROOT;
set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT "$HOME/perl5";
set -x PERL_MB_OPT --install_base\ \"$HOME/perl5\";
set -x PERL_MM_OPT INSTALL_BASE=$HOME/perl5;

# pacman / paru
alias pacsyu='sudo pacman -Syu'                 # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'               # Refresh pkglist & update standard pkgs
alias pacss='pacman -Ss'                        # Search for standard pkgs
alias parssa='paru -Ssa'                        # Search for AUR pkgs
alias parsua='paru -Sua'                        # update only AUR pkgs
alias parsyu='paru -Syu'                        # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'   # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages

# other package managers
alias pn='pnpm'               # PNPM
alias pni='pn install'        # install Node.js module
alias pnu='pn uninstall'      # uninstall Node.js module
alias pipi='pip install'      # install Python module
alias pipu='pip uninstall'    # uninstall Python module
alias pipl='pip list'         # list installed Python modules
alias pipfr='pip freeze'      # list installed Python modules (requirements.txt format)

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --country \"United States\" --protocol https --fastest 30 --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

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
alias gitpl='git pull'
alias gitsh='git stash'

### INIT STARSHIP PROMPT
starship init fish | source
