source ~/Documents/projects/bash/antibody_darwin_amd64/antibody.zsh

# general bundles
# Syntax highlighting bundle.
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle common-aliases
antibody bundle rupa/z
antibody bundle colored-man
antibody bundle colorize
antibody bundle zsh-users/zsh-completions
antibody bundle djui/alias-tips
# Guess what to install when running an unknown command.
antibody bundle command-not-found
# ZSH port of Fish shell's history search feature.
antibody bundle zsh-users/zsh-history-substring-search
# Git
antibody bundle git
antibody bundle git-extras
# Docker
antibody bundle docker
# Node-related
antibody bundle node
antibody bundle bower
antibody bundle npm
antibody bundle nvm


# os-specific
if [[ $CURRENT_OS == 'OS X' ]]; then
    antibody bundle brew
    antibody bundle brew-cask
    antibody bundle osx
fi

antibody apply

# zmv looks useful: http://strcat.de/zsh/#zmv
autoload -U zmv