#!/usr/bin/env zsh
#!/bin/zsh
#   _______             _
#  |___  / |           (_)
#     / /| | ___   __ _ _ _ __
#    / / | |/ _ \ / _` | | '_ \
#  ./ /__| | (_) | (_| | | | | |
#  \_____/_|\___/ \__, |_|_| |_|
#                  __/ |
#                 |___/
#

# Load external Plugins
source $PLUGIN_DIR/syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUGIN_DIR/autosuggestions/zsh-autosuggestions.zsh
source $PLUGIN_DIR/history-substring-search/zsh-history-substring-search.zsh

## Specify settings for plugins
# Set highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
# Set color of autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=69'

# Bind ^[[A/^[[B for history search after sourcing the file
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

## Initialize compinit
run-compinit

## Create history files and folders if does not exist.
# $HISTFILE belongs in the data home, not with the configs
if [[ ! -f "$HISTFILE" ]]; then
  mkdir -pv "$HISTFILE:h" && touch "$HISTFILE"
fi

if [[ ! -f "$LESSHISTFILE" ]]; then
  mkdir -pv "$LESSHISTFILE:h" && touch "$LESSHISTFILE"
fi

if [[ ! -f "$MYSQL_HISTFILE" ]]; then
  mkdir -pv "$MYSQL_HISTFILE:h" && touch "$MYSQL_HISTFILE"
fi
