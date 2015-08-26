# load zgen
source "${HOME}/Documents/projects/scripts/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen loadall <<EOPLUGINS
        djui/alias-tips
		zsh-users/zsh-completions
		zsh-users/zsh-syntax-highlighting
		zsh-users/zsh-history-substring-search
        tarruda/zsh-autosuggestions
		marzocchi/zsh-notify
		unixorn/docker-helpers.zshplugin
EOPLUGINS
    # save all to init script
    zgen save
fi


# rupa/z
export _Z_NO_PROMPT_COMMAND=1
source ~/Documents/projects/scripts/z/z.sh
precmd() {
    _z --add "$(pwd -P)"
}

# zmv looks useful: http://strcat.de/zsh/#zmv
autoload -U zmv
# Pure theme init
autoload -U promptinit && promptinit
prompt pure