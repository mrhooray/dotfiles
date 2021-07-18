#!/bin/bash
font_src_dir=$( cd "$( dirname "$0" )" && pwd )
find_command="find \"$font_src_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

if [[ `uname` == 'Darwin' ]]; then
    font_dst_dir="$HOME/Library/Fonts"
else
    font_dst_dir="$HOME/.local/share/fonts"
    mkdir -p $font_dst_dir
fi

eval $find_command | xargs -0 -I % cp "%" "$font_dst_dir/"

if command -v fc-cache @>/dev/null ; then
    fc-cache -f $font_dst_dir
fi
