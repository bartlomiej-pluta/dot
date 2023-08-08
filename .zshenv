#!/bin/zsh

# Here we have the most basic ZSH environment variables
# which are required to properly locate the ZSH config directory.
# The rest of environment variables is placed in the $ZDOTDIR/env file.

# XDG
export XDG_CONFIG_HOME="$HOME/.local/config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.local/cache"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
