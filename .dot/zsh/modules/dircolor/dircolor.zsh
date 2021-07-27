#!/bin/zsh
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

currentdir="${0:h}"
# Source generated file only if does not exist or older then config file
if [[ ! -f $currentdir/ls_colors.zsh || $currentdir/LS_COLORS -nt $currentdir/ls_colors.zsh ]]; then
    dircolors -b $currentdir/LS_COLORS > $currentdir/ls_colors.zsh
fi
source $currentdir/ls_colors.zsh
