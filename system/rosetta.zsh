# Some translations between OSX and Linux

if (( $+commands[xclip] )) ; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

if (( $+commands[xdg-open] )) ; then
  alias open='xdg-open'
fi
