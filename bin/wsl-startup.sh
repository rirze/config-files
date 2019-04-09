#!/bin/bash


export DISPLAY=:0
xmodmap /home/chron/.Xmodmap
if ! pgrep -f "emacs .*-daemon.*" > /dev/null
then
    emacs --daemon > /dev/null
    echo "Emacs Server is up and running!"
fi

# wslview -r
