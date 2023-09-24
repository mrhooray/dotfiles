if test -d ~/.local/share/fnm
  set -gx PATH ~/.local/share/fnm $PATH
end

if type -q fnm
  fnm env | source
end
