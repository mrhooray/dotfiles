if type -q bun
    fish_add_path ~/.bun/bin
end

if test -d $XDG_DATA_HOME/fnm
    fish_add_path $XDG_DATA_HOME/fnm
end

if type -q fnm
    fnm env | source
end

set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
