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

# Load external slow Plugins
source $PLUGIN_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# If loaded before highlighting takes 10-20 ms
source $PLUGIN_DIR/history-substring-search/zsh-history-substring-search.zsh

# Bind ^[[A/^[[B for history search after sourcing the file
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

## Initialize compinit
run-compinit
