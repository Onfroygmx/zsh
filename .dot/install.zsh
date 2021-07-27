#!/usr/bin/env zsh
#!/bin/zsh
#   _____          _        _ _
#  |_   _|        | |      | | |
#    | | _ __  ___| |_ __ _| | |
#    | || '_ \/ __| __/ _` | | |
#   _| || | | \__ \ || (_| | | |
#   \___/_| |_|___/\__\__,_|_|_|
#
# https://patorjk.com/software/taag/#p=display&c=bash&f=Doom&t=Install
### Install basic tools

## Autoload zsh functions
#################################################
autoload -U colors && colors

## Export work folders
#################################################
export XDG_CONFIG_HOME=$HOME/.dot
export XDG_DATA_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"/data

export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh

printf "\n$fg[green]Clone: Onfroygmx/zsh$reset_color\n"
git clone --bare https://github.com/Onfroygmx/zsh.git $HOME/.dotgit
git --git-dir=$HOME/.dotgit --work-tree=$HOME checkout

printf "\n$fg[green]Symlink zshenv file$reset_color\n"
## Set zshenv file
[[ ! -f $HOME/.zshenv && -f $ZDOTDIR/zshenv ]] && ln -s $ZDOTDIR/zshenv $HOME/.zshenv

printf "\n$fg[green]Create other folders$reset_color\n"
# Create plugins dir
PLUGINS_DIR="$XDG_CONFIG_HOME/plugins"
[[ ! -d "$PLUGINS_DIR" ]] && mkdir -p $PLUGINS_DIR


if [[ ! -d "$XDG_DATA_HOME" ]]; then
    # $HISTFILE belongs in the data home, not with the configs
    HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
    if [[ ! -f "$HISTFILE" ]]; then
      mkdir -pv "$HISTFILE:h" && touch "$HISTFILE"
    fi

    LESSHISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/less/history"
    if [[ ! -f "$LESSHISTFILE" ]]; then
      mkdir -pv "$LESSHISTFILE:h" && touch "$LESSHISTFILE"
    fi

    MYSQL_HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/mysql/history"
    if [[ ! -f "$MYSQL_HISTFILE" ]]; then
      mkdir -pv "$MYSQL_HISTFILE:h" && touch "$MYSQL_HISTFILE"
    fi

    NANO_HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/nano/search_history"
    if [[ ! -f "$NANO_HISTFILE" ]]; then
      mkdir -pv "$NANO_HISTFILE:h" && touch "$NANO_HISTFILE"
    fi
fi

printf "\n$fg[green]Set permission 700 to all created folders$reset_color\n"
find $XDG_CONFIG_HOME -type d -print0 | xargs -0 chmod 700
mv .dotgit $XDG_CONFIG_HOME

printf "\n$fg[Cyan]Clone external Plugins$reset_color\n"


printf "\n$fg[green]Clone: zsh-users/zsh-autosuggestions$reset_color\n"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $PLUGINS_DIR/autosuggestions
printf "\n$fg[green]Clone: zsh-users/zsh-completions$reset_color\n"
git clone https://github.com/zsh-users/zsh-completions.git $PLUGINS_DIR/completions
printf "\n$fg[green]Clone: zsh-users/zsh-history-substring-search$reset_color\n"
git clone https://github.com/zsh-users/zsh-history-substring-search.git $PLUGINS_DIR/history-substring-search
printf "\n$fg[green]Clone: zsh-users/zsh-syntax-highlighting$reset_color\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGINS_DIR/syntax-highlighting

printf "\n$fg[green]Clone: zdharma/fast-syntax-highlighting$reset_color\n"
git clone https://github.com/zdharma/fast-syntax-highlighting.git $PLUGINS_DIR/fast-syntax-highlighting

printf "\n$fg[yellow]Install fininshed, restart ZSH$reset_color\n"
