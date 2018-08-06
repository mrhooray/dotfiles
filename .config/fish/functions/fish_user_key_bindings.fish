function fish_user_key_bindings
  bind \cx\ce edit_command_line
end

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
