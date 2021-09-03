#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

readonly logfile="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $*" | tee -a "$logfile" >&2 ; }
warning() { echo "[WARNING] $*" | tee -a "$logfile" >&2 ; }
error()   { echo "[ERROR]   $*" | tee -a "$logfile" >&2 ; }
fatal()   { echo "[FATAL]   $*" | tee -a "$logfile" >&2 ; exit 1 ; }

todofile="$HOME/todo.md"
todo()    { echo "- [ ] $*" >> "$todofile" ; }

lockfile="/tmp/yadm-bootstrap.lock"
resources="$HOME/.config/yadm/bootstrap-resources"

cleanup() {
   rm -f "$lockfile"
   exit
}

# Main script
if { set -C; 2>/dev/null >"$lockfile"; }; then
   trap cleanup EXIT  

   # Bootstrap script goes here...
else
   fatal "Lock file '"$lockfile"' exists... Exiting"
fi
