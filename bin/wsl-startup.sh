#!/bin/bash


export DISPLAY=:0
xmodmap /home/chron/.Xmodmap
if ! pgrep -f "emacs -daemon" > /dev/null
then
    emacs --daemon
fi
