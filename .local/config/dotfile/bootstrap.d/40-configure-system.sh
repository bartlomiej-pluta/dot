set -euo pipefail
IFS=$'\n\t'

readonly logfile="$1"
readonly lockfile="$2"
readonly os="$3"
readonly distro="$4"
readonly class="$5"
info()    { echo "[INFO]    $*" | tee -a "$logfile" >&2 ; }
warning() { echo "[WARNING] $*" | tee -a "$logfile" >&2 ; }
error()   { echo "[ERROR]   $*" | tee -a "$logfile" >&2 ; }
fatal()   { echo "[FATAL]   $*" | tee -a "$logfile" >&2 ; exit 1 ; }

todofile="$HOME/todo.md"
todo()    { echo "- [ ] $*" >> "$todofile" ; }

resources="$HOME/.config/yadm/bootstrap-resources"

cleanup() {
   rm -f "$lockfile"
   exit
}

# Main script
if { set -C; 2>/dev/null >"$lockfile"; }; then
   trap cleanup EXIT  

   # Bootstrap script goes here...
   todo "Change shell to zsh with following command: chsh $USER --shell "$(which zsh)

   if python -c "import pywal" > /dev/null 2>&1 ; then
      todo "Please set PyWAL wallpaper: pywal -i path/to/wallpaper.png (or python -m pywal -i path/to/wallpaper.png)"
   fi

   if ! command -v delta > /dev/null ; then
      todo "Install delta pager/diff tool as it is required for current Git configuration"
   fi

   if ! command -v starship > /dev/null ; then
      todo "[Optional] Install starship package (https://starship.rs/guide/#%F0%9F%9A%80-installation) for ZSH prompt"
   fi
else
   fatal "Lock file '"$lockfile"' exists... Exiting"
fi
