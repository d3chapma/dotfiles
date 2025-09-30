function qq() {
  local dir
  dir="$(quickcode)" || return 1
  if [[ -d "$dir" ]]; then
    cd "$dir" || return 1
  else
    echo "Selection failed or directory doesn't exist: $dir" >&2
    return 1
  fi
}

if typeset -f qq >/dev/null 2>&1; then
  # Create a zle widget that calls the qq function
  qq-widget() {
    # Use zle -I to clear any partial input and redraw
    zle -I
    # Call the function; if it fails, print a newline so prompt is fresh
    qq || echo
    # After running, redraw the prompt
    zle reset-prompt
  }

  # Tell zsh this function is a zle widget
  zle -N qq-widget

  # Bind Ctrl+C to the widget in the main keymap
  bindkey '^f' qq-widget
fi
