#!/usr/bin/env bash

#/ Usage:
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message

set -euo pipefail
IFS=$'\n\t'

usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

readonly logfile="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $*" | tee -a "$logfile" >&2 ; }
warning() { echo "[WARNING] $*" | tee -a "$logfile" >&2 ; }
error()   { echo "[ERROR]   $*" | tee -a "$logfile" >&2 ; }
fatal()   { echo "[FATAL]   $*" | tee -a "$logfile" >&2 ; exit 1 ; }

cleanup() {
  # Remove temporary files
  # Restart services
  # ...
	exit
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
  trap cleanup EXIT
  # Script goes here
  # ...
fi
