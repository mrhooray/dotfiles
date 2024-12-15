set -g fish_color_normal cad3f5
set -g fish_color_command 8aadf4
set -g fish_color_param f0c6c6
set -g fish_color_keyword ed8796
set -g fish_color_quote a6da95
set -g fish_color_redirection f5bde6
set -g fish_color_end f5a97f
set -g fish_color_comment 8087a2
set -g fish_color_error ed8796
set -g fish_color_gray 6e738d
set -g fish_color_selection --background=363a4f
set -g fish_color_search_match --background=363a4f
set -g fish_color_option a6da95
set -g fish_color_operator f5bde6
set -g fish_color_escape ee99a0
set -g fish_color_autosuggestion 6e738d
set -g fish_color_cancel ed8796
set -g fish_color_cwd eed49f
set -g fish_color_user 8bd5ca
set -g fish_color_host 8aadf4
set -g fish_color_host_remote a6da95
set -g fish_color_status ed8796
set -g fish_pager_color_progress 6e738d
set -g fish_pager_color_prefix f5bde6
set -g fish_pager_color_completion cad3f5
set -g fish_pager_color_description 6e738d

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_BIN_HOME $HOME/.local/bin
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx LSCOLORS Gxfxcxdxbxegedabagacad

set -gx EDITOR nvim
set -gx LESSHISTFILE $XDG_STATE_HOME/less/history
set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/ripgreprc
set -gx FZF_DEFAULT_COMMAND 'rg --files-with-matches "."'
set -gx FZF_DEFAULT_OPTS '-m --height 50% --border'
set -gx NNN_COLORS '#a744b322'
set -gx NNN_FCOLORS c1e2ff6ff36dccf7c6e3aba1

fish_add_path $XDG_BIN_HOME
fish_add_path $HOME/.dotfiles/bin

alias e $EDITOR
alias l 'll -A'
alias g 'lazygit -ucd $HOME/.config/lazygit/'
alias nnn 'nnn -dHo'

function source_by_unix
    switch (uname)
        case Linux
            source (string replace -r '.fish$' '\-linux.fish' (status -f))
        case Darwin
            source (string replace -r '.fish$' '\-darwin.fish' (status -f))
    end
end

source_by_unix

for f in (dirname (status -f))/langs/*.fish
    source $f
end

if test -e $HOME/.local.fish
    source $HOME/.local.fish
end

if type -q starship
    starship init fish | source
end
