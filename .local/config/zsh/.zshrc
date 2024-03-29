#!/bin/zsh

# Options section
## Disable beeping
setopt NO_BEEP

## Use VIM keymaps
setopt vi

## Change directory without cd
setopt AUTO_CD

## History
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

## Directory stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Sources
## Update fpath
fpath=("$ZDOTDIR/sources" "$ZDOTDIR/prompts" "$ZDOTDIR/plugins/sd" $fpath)

## Prompt
# autoload -Uz prompt.zsh; prompt.zsh
if command -v starship >/dev/null ; then
   # Starship prompt
   eval "$(starship init zsh)"
else
   autoload -Uz promptinit; promptinit
   prompt bartek
fi

## Autocompletion
autoload -Uz compinit; compinit
autoload -Uz completion.zsh; completion.zsh

## Lazy loading
autoload -Uz lazy_loading.zsh; lazy_loading.zsh

# Enable builtin ZSH calculator
autoload zcalc

# Enable builtin bulk renamer
autoload zmv

# Environment variables
source "$ZDOTDIR/env"

# Aliases and functions
source "$ZDOTDIR/aliases"
source "$ZDOTDIR/functions"

# Key binding
source "$ZDOTDIR/keybinding"

# Plugins
plugins=(
   "$ZDOTDIR/plugins/fzf/key-bindings.zsh"
   "$ZDOTDIR/plugins/fzf/completion.zsh"
   "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
   "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
   "$ZDOTDIR/plugins/bd/bd.zsh"
   "$ZDOTDIR/plugins/sd/sd.plugin.zsh"
)

## Load automatically plugins
for plugin in $plugins; do [[ -s "$plugin" ]] && source "$plugin"; done

# Set PyWAL colors
if command -v wal > /dev/null ; then
  (/usr/bin/cat ~/.cache/wal/sequences 2>/dev/null || true &)
  source ~/.cache/wal/colors-tty.sh 2>/dev/null || true
fi

# Run TMUX (exec instead of fork)
if command -v tmux > /dev/null ; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux -u -2 || true
fi
