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

if [[ ! -f "$NANO_HISTFILE" ]]; then
  mkdir -pv "$NANO_HISTFILE:h" && touch "$NANO_HISTFILE"
fi
