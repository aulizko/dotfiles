# Credits to https://github.com/holman/dotfiles/

export GOPATH=$PROJECTS/go
export PATH="$GOPATH/bin:$PATH"

# Allow cgo for local development
export CGO_CXXFLAGS_ALLOW=".*"
export CGO_LDFLAGS_ALLOW=".*"
export CGO_CFLAGS_ALLOW=".*"
