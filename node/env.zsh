# TODO: check if this is really needed
if is_osx ; then
  export PATH="$PATH:`yarn global bin`"
fi

# Enable persistent REPL history for `node`.
NODE_REPL_HISTORY_FILE=~/.node_history
# Allow 32³ entries; the default is 1000.
NODE_REPL_HISTORY_SIZE='32768'

