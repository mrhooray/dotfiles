set -gx PATH $HOME/.local/bin $PATH
set -gx PIPENV_VENV_IN_PROJECT 1
set -gx IPYTHONDIR $XDG_CONFIG_HOME/ipython
set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc

alias pip pip3
alias python python3
