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

## Lazy loading
autoload -Uz lazy_loading.zsh; lazy_loading.zsh

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
(/usr/bin/cat ~/.cache/wal/sequences >/dev/null 2>&1 || true &)

# Run TMUX
if command -v tmux > /dev/null ; then
   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux
fi

