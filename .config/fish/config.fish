set -U fish_color_autosuggestion 9e9e9e
set -U fish_color_command 00d700
set -U fish_color_comment 878787
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end 969696
set -U fish_color_error ff0000
set -U fish_color_escape cyan
set -U fish_color_history_current cyan
set -U fish_color_host -o cyan
set -U fish_color_match cyan
set -U fish_color_normal normal
set -U fish_color_operator cyan
set -U fish_color_param dadada
set -U fish_color_quote ffff87
set -U fish_color_redirection dadada
set -U fish_color_search_match --background=purple
set -U fish_color_selection --background=purple
set -U fish_color_status red
set -U fish_color_user -o green
set -U fish_color_valid_path --underline
set -U fish_pager_color_completion normal
set -U fish_pager_color_description 555 yellow
set -U fish_pager_color_prefix cyan
set -U fish_pager_color_progress cyan

set -gx EDITOR vim
set -gx HOMEBREW_CASK_OPTS --appdir=/Applications
set -gx LSCOLORS Gxfxcxdxbxegedabagacad
set -gx PATH ~/.dotfiles/bin $PATH
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc
set -gx FZF_DEFAULT_COMMAND 'rg --files-with-matches "."'
set -gx FZF_DEFAULT_OPTS '-m --height 50% --border'
set -gx NNN_COLORS '#a744b322'
set -gx NNN_FCOLORS 'c1e2ff6ff36dccf7c6e3aba1'

alias e $EDITOR
alias l 'll -A'
alias g 'lazygit -ucd ~/.config/lazygit/'
alias nnn 'nnn -dHo'

if type -q starship
  starship init fish | source
end

for f in (dirname (status -f))/langs/*.fish
  source $f
end

if test -e ~/.local.fish
  source ~/.local.fish
end
