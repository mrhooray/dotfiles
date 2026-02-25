set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_BIN_HOME $HOME/.local/bin
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx LSCOLORS Gxfxcxdxbxegedabagacad

set -gx EDITOR nvim
set -gx LESSHISTFILE $XDG_STATE_HOME/less/history
set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/ripgreprc
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx FZF_DEFAULT_OPTS '-m --height 50% --border'
set -gx NNN_COLORS '#a744b322'
set -gx NNN_FCOLORS c1e2ff6ff36dccf7c6e3aba1
