# Keybindings and related stuff

# FZF
source /usr/local/opt/fzf/shell/key-bindings.zsh

# Use emacs key bindings
bindkey -e

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char
