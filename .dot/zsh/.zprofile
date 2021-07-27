#!/usr/bin/env zsh
#!/bin/zsh
#   ______                 __ _ _
#  |___  /                / _(_) |
#     / / _ __  _ __ ___ | |_ _| | ___
#    / / | '_ \| '__/ _ \|  _| | |/ _ \
#  ./ /__| |_) | | | (_) | | | | |  __/
#  \_____/ .__/|_|  \___/|_| |_|_|\___|
#        | |
#        |_|
#
## This file is sourced before zshrc

################################
# EXPORT ENVIRONMENT DIRECTORY #
################################
export MODULE_DIR=$ZDOTDIR/modules
export PLUGIN_DIR=$XDG_CONFIG_HOME/plugins

# Set specific XDG variables
export XDG_DATA_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"/data

# Set standard paths
path=(
  /usr/local/{sbin,bin}
  /usr/{sbin,bin}
  /{sbin,bin}
  ~/bin
  $path
)

# Set the list of directories that man searches for manuals.
manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
)

# Ensure path arrays do not contain duplicates.
typeset -gU path manpath fpath

# Add completion add the begining of fpath and custom functions at the end
fpath=( "$PLUGIN_DIR/completions/src" "${fpath[@]}" "$ZDOTDIR/functions" )
autoload -Uz $fpath[-1]/*(.:t)
