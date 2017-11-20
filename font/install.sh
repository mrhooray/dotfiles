#!/bin/bash
powerline_fonts_dir=$( cd "$( dirname "$0" )" && pwd )
find_command="find \"$powerline_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

if [[ `uname` == 'Darwin' ]]; then
    font_dir="$HOME/Library/Fonts"
else
    font_dir="$HOME/.local/share/fonts"
    mkdir -p $font_dir
fi

eval $find_command | xargs -0 -I % cp "%" "$font_dir/"

if command -v fc-cache @>/dev/null ; then
    fc-cache -f $font_dir
fi
