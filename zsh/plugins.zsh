source /usr/local/Cellar/zplug/2.4.1/init.zsh

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "djui/alias-tips"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "tarruda/zsh-autosuggestions"
zplug "b4b4r07/enhancd"


# Install plugins if there are plugins that have not been installed
if ! zplug check ; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
