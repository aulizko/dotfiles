# Use colors in coreutils utilities output
if is_osx ; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias grep='grep --color'
