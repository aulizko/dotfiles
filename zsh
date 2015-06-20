source ~/Documents/projects/bash/antibody_darwin_amd64/antibody.zsh

# general bundles
# Syntax highlighting bundle.
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle marshallmick007/osx-dev-zsh-plugin
antibody bundle zsh-users/zsh-completions
antibody bundle djui/alias-tips
# ZSH port of Fish shell's history search feature.
antibody bundle zsh-users/zsh-history-substring-search
# Pure theme
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

# zmv looks useful: http://strcat.de/zsh/#zmv
autoload -U zmv
autoload -U promptinit && promptinit
prompt pure