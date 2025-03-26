# Can edit current command in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line

# Copy current command
copybuffer () {
  # If line is empty, get the last run command from history
  if test -z $BUFFER; then
    buf=$(fc -ln -1)
  else
    buf=$BUFFER
  fi

  printf "%s" "$buf" | pbcopy
}
zle -N copybuffer
bindkey '^X^y' copybuffer
