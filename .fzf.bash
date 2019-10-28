# Setup fzf
# ---------
if [[ ! "$PATH" == */home/chronos/cart/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/chronos/cart/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/chronos/cart/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
# source "/home/chronos/cart/fzf/shell/key-bindings.bash"

# Set custom variables
# ------------
export FZF_DEFAULT_COMMAND='fd --type file'
