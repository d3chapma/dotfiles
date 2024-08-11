export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow . "$1"
}

# Use fd to generate the list for path completion
_fzf_compgen_path() {
  fd --type f --hidden --follow . "$1"
}
