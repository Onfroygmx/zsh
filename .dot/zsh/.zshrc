#!/usr/bin/env zsh
#!/bin/zsh
#   ______    _
#  |___  /   | |
#     / / ___| |__  _ __ ___
#    / / / __| '_ \| '__/ __|
#  ./ /__\__ \ | | | | | (__
#  \_____/___/_| |_|_|  \___|
#

## Set prompt

# enable substitution for prompt
setopt prompt_subst

# Verry simple prompt
PROMPT='%F{green}%n%f %F{cyan}%(4~|%-1~/.../%2~|%~)%f %F{magenta}%B>%b%f '
RPROMPT='%(?.%F{green}.%F{red}[%?] - )%B%D{%H:%M:%S}%b%f'

## Source Modules and plugins
# Load personal Modules
for file in $MODULE_DIR/**/*.zsh; source $file

# Load external Plugins
source $PLUGIN_DIR/autosuggestions/zsh-autosuggestions.zsh
source $PLUGIN_DIR/syntax-highlighting/zsh-syntax-highlighting.zsh
# If loaded before highlighting takes 10-20 ms
source $PLUGIN_DIR/history-substring-search/zsh-history-substring-search.zsh

# Specify settings for plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=69'

# Bind ^[[A/^[[B for history search after sourcing the file
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
