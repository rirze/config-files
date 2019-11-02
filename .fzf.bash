# Setup fzf
# ---------
if [[ ! "$PATH" == */home/chronos/cart/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/chronos/cart/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/chronos/cart/fzf/shell/completion.bash" 2> /dev/null

complete -F _fzf_path_completion -o default -o bashdefault emax
complete -F _fzf_path_completion -o default -o bashdefault emacs

# Key bindings
# ------------
source "/home/chronos/cart/fzf/shell/key-bindings.bash"
bind -x '"\C-x\C-f": "fzf-file-widget"'

# Set custom variables
# ------------
export FZF_DEFAULT_COMMAND='fd --type file'
