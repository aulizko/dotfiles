export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

RIPZ_TEXT=💡

BRONZE=(status:black:white dir:blue:black git:green:black cmdtime:yellow:black)
export BRONZE_DIR_LENGTH=5
export BRONZE_CMDTIME_THRESHOLD=1s
export BRONZE_SHELL=zsh

eval "$(bronze init)"