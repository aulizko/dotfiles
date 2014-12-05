source ~/bin/dotfiles/antigen.zsh

antigen use oh-my-zsh

# general bundles
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle common-aliases
antigen bundle rupa/z
antigen bundle colored-man
# Guess what to install when running an unknown command.
antigen bundle command-not-found
# ZSH port of Fish shell's history search feature.
antigen bundle zsh-users/zsh-history-substring-search
# Git
antigen bundle git
# Docker
antigen bundle docker
# Node-related
antigen bundle node
antigen bundle bower
antigen bundle npm
antigen bundle nvm


# os-specific
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
fi

antigen theme sorin

antigen apply