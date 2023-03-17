# Use homebrew version of grep instead of builtin

set -l homebrew_grep_path /usr/local/opt/grep/libexec/gnubin
set -gx PATH $homebrew_grep_path $PATH
