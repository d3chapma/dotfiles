function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
