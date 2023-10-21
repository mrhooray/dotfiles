if test -d $XDG_DATA_HOME/fnm
  set -gx PATH $XDG_DATA_HOME/fnm $PATH
end

if type -q fnm
  fnm env | source
end

set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
