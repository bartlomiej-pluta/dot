#!/bin/zsh

# Options section
## Disable beeping
setopt NO_BEEP

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
fpath=("$ZDOTDIR/sources" "$ZDOTDIR/prompts" $fpath)

## Prompt
#autoload -Uz prompt.zsh; prompt.zsh
autoload -Uz promptinit; promptinit
prompt bartek

## Autocompletion
autoload -Uz compinit; compinit
autoload -Uz completion.zsh; completion.zsh

## Lazy loading
autoload -Uz lazy_loading.zsh; lazy_loading.zsh

# Path
# Disclaimer: This variable couldn't be located in ~/.zshenv
# because of the fact, that the ~/.zshenv is laoded at the
# pretty early stage and then it could be updated
# with system-related value (it actually happens on Mac OS X).
# In order to prevent that, the PATH should be defined right in here
# to enforce highest priority of defined locations (the locations
# defined in here will be effectively at the top and will be the first locations
# to look for given executables).
typeset -U PATH path
path=("$HOME/.local/scripts" "$HOME/.local/bin" "$path[@]")
export PATH

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
)

## Load automatically plugins
for plugin in $plugins; do [[ -s "$plugin" ]] && source "$plugin"; done

# SDKMAN! (this must be at the end of the file for SDKMAN to work)
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh" || true

# Set PyWAL colors
if command -v wal > /dev/null ; then
  (/usr/bin/cat ~/.cache/wal/sequences || true &)
  source ~/.cache/wal/colors-tty.sh || true
fi

# Run TMUX
if command -v tmux > /dev/null ; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux -u -2 || true
fi

