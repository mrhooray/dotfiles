if test (uname) = Darwin
    set -gx XDG_RUNTIME_DIR (getconf DARWIN_USER_TEMP_DIR)

    set -gx HOMEBREW_CASK_OPTS --appdir=/Applications
    fish_add_path /opt/homebrew/bin
end
