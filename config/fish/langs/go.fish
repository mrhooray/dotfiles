if test -d /usr/local/go
  set -gx PATH /usr/local/go/bin $PATH
end

set -gx GOPATH $XDG_DATA_HOME/go
set -gx PATH $GOPATH/bin $PATH
