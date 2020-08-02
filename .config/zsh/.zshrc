#!/bin/zsh

# Options section
## Disable beeping
setopt NO_BEEP

## Change directory without cd
setopt AUTO_CD

## Enable spell autocorrection
setopt CORRECT
setopt CORRECT_ALL

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

# Aliases and functions
source "$ZDOTDIR/aliases"
source "$ZDOTDIR/functions"

# Plugins
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/git/git.zsh"
source "$ZDOTDIR/plugins/bd/bd.zsh"


# SDKMAN! (this must be at the end of the file for SDKMAN to work)
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
