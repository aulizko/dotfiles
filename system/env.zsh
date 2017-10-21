# As Homebrew links installed packages to /usr/local/*
# Add /usr/local/(s)bin when on OSX
if [[ $PLATFORM_NAME == 'darwin' ]] ; then
  export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"
fi

export PATH="./bin:$ZSH/bin:$PATH"

export PATH="$PATH:~/Applications/WebStorm/bin"

export EDITOR="mate -w"

export VISUAL="e"
