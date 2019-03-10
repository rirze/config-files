#!/bin/bash

xmodmap /home/chron/.Xmodmap
export DISPLAY=:0
emacs --daemon
