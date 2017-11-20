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

set -x EDITOR vim
set -x HOMEBREW_CASK_OPTS --appdir=/Applications
set -x LSCOLORS Gxfxcxdxbxegedabagacad
set -x PATH ~/.dotfiles/bin $PATH

alias e $EDITOR
alias l "ll -A"

function edit_command_line
  set -l f (mktemp /tmp/fish.cmd.XXXXXXXX)
  if test -n "$f"
    set -l p (commandline -C)
    commandline -b > $f
    e $f
    commandline -r (more $f)
    commandline -C $p
    command rm $f
  end
end

function fish_user_key_bindings
  bind \cx\ce edit_command_line
end

if test -e ~/.local.fish
  source ~/.local.fish
end
