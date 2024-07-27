set -gx PIPENV_VENV_IN_PROJECT 1
set -gx IPYTHONDIR $XDG_CONFIG_HOME/ipython
set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc
set -gx PYTHON_HISTORY $XDG_STATE_HOME/python/python_history
set -Ua fish_user_paths "$HOME/.rye/shims"
