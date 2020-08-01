#!/bin/zsh

export TERM="rxvt-256color"

# Path
export PATH=$HOME/.local/scripts:$HOME/.local/bin:$PATH

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
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#444444"

# Editor
export EDITOR="vim"
export VISUAL="vim"

# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
