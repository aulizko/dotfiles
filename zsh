source ~/Documents/projects/bash/antibody_darwin_amd64/antibody.zsh
source ~/Documents/projects/bash/z/z.sh

# general bundles
antibody bundle djui/alias-tips
# Syntax highlighting bundle.
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-syntax-highlighting
# ZSH port of Fish shell's history search feature.
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle tarruda/zsh-autosuggestions
# Pure theme
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
# ZSH notify looks usefull
antibody bundle marzocchi/zsh-notify
# Docker helper
antibody bundle unixorn/docker-helpers.zshplugin

antibody update

# zmv looks useful: http://strcat.de/zsh/#zmv
autoload -U zmv
