set -gx XDG_RUNTIME_DIR /tmp/user/(id -u)
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR

set -gx HOMEBREW_CASK_OPTS --appdir=/Applications
fish_add_path /opt/homebrew/bin
