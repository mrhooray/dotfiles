if type -q bun
    set -gx BUN_INSTALL $HOME/.bun
    fish_add_path $BUN_INSTALL/bin
end

if test -d $XDG_DATA_HOME/fnm
    fish_add_path $XDG_DATA_HOME/fnm
end

if type -q fnm
    fnm env | source
end
