# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias op='xdg-open'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias wsl-alert='powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Users\scheedalla\alert.ps1" -msgtype "$([ $? = 0 ] && echo Info || echo Error)" -title "WSL Terminal" -msg "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*wsl-alert$//'\'')"'

alias phgrep='cat ~/.persistent_history|grep --color'
alias emaxt='emacsclient -t'
alias emax='emacsclient -cnqu'

alias ip='curl ifconfig.me'
alias arch='getconf LONG_BIT'
alias distro='cat /etc/issue'
