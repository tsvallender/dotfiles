# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tsv/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tsv/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/tsv/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/tsv/.fzf/shell/key-bindings.bash"
