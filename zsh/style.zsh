export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# https://github.com/jedahan/ripz
RIPZ_TEXT=💡

# https://github.com/reujab/silver/
SILVER=(status:red:white time:magenta:black dir:blue:black git:green:black cmdtime:yellow:black)
export SILVER_DIR_LENGTH=5
export SILVER_CMDTIME_THRESHOLD=15s
export SILVER_SHELL=zsh

eval "$(silver init)"
