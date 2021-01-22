#!/bin/zsh

export TERM="rxvt-256color"

# Path
typeset -U PATH path
path=("$HOME/.local/scripts" "$HOME/.local/bin" "$path[@]")
export PATH

# Language
# export LANG=en_US.UTF-8

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# ZSH Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# GPG
export GPG_TTY=$(tty)

# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
