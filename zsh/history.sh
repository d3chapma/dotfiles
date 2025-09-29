HISTSIZE=10000              # Set the amount of lines to keep in memory
HISTFILE=~/.zsh_history     # Where to save command history
SAVEHIST=10000              # This is required to actually save them, needs to match with HISTSIZE
setopt SHARE_HISTORY        # Share history between all sessions.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks before recording entry.
setopt HIST_IGNORE_SPACE    # Don't record an entry starting with a space.
