export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,anaconda3,elasticsearch-*
"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
