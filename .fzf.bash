# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tsv/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tsv/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/tsv/.fzf/completion.bash"

# Key bindings
# ------------
source "/home/tsv/.fzf/key-bindings.bash"
