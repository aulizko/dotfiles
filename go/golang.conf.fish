set -l golang_path $HOME/projects/go

if [ $GOPATH ]
    set golang_path $GOPATH
end

set -gx GOPATH $golang_path

set -l golang_bin_path $golang_path/bin

contains -- $golang_bin_path $PATH
or set -gx PATH $golang_bin_path $PATH

# Allow cgo for local development
set -gx CGO_CXXFLAGS_ALLOW ".*"
set -gx CGO_LDFLAGS_ALLOW ".*"
set -gx CGO_CFLAGS_ALLOW ".*"
