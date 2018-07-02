export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# https://github.com/jedahan/ripz
RIPZ_TEXT=💡

# https://github.com/reujab/bronze/
BRONZE=(status:red:white dir:blue:black git:green:black cmdtime:yellow:black)
export BRONZE_DIR_LENGTH=5
export BRONZE_CMDTIME_THRESHOLD=15s
export BRONZE_SHELL=zsh

eval "$(bronze init)"