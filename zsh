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
      b4b4r07/enhancd
      rimraf/k
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

# pass autocompletion
fpath=("${HOME}/Documents/projects/scripts/dotfiles/pass" $fpath)

source "${HOME}/Documents/projects/scripts/dotfiles/radio"


# zmv looks useful: http://strcat.de/zsh/#zmv
autoload -U zmv

# Pure theme init
autoload -U promptinit && promptinit
prompt pure