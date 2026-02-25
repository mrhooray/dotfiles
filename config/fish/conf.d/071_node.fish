if type -q bun
    set -gx BUN_INSTALL $HOME/.bun
    fish_add_path $BUN_INSTALL/bin
end

if type -q fnm
    fnm env | source
end
