#!/bin/zsh

# Here we have the most basic ZSH environment variables
# which are required to properly locate the ZSH config directory.
# The rest of environment variables is placed in the $ZDOTDIR/env file.

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
