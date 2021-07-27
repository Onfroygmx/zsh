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

export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh

printf "\n$fg[green]Clone: Onfroygmx/zsh$reset_color\n"
git clone --bare https://github.com/Onfroygmx/zsh.git $HOME/.dotgit
git --git-dir=$HOME/.dotgit --work-tree=$HOME checkout

printf "\n$fg[green]Symlink zshenv file$reset_color\n"
## Set zshenv file
[[ ! -f $HOME/.zshenv && -f $ZDOTDIR/zshenv ]] && ln -s $ZDOTDIR/zshenv $HOME/.zshenv

PLUGINS_DIR="$XDG_CONFIG_HOME/Plugins"

[[ ! -d "$PLUGINS_DIR" ]] && mkdir -p $PLUGINS_DIR

source $ZDOTDIR/modules/history/history.zsh

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

printf "\n$fg[yellow]Install fininshed, restart ZSH$reset_color\n"
