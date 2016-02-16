HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

autoload -U compinit
compinit

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

source $HOME/Projects/dotfiles/zsh/aliases
source $HOME/Projects/dotfiles/zsh/functions
source $HOME/Projects/dotfiles/zsh/prompt

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Postgres.app/Contents/Versions/9.3/bin"

alias gf='git fetch -p'
function dbpull(){
  curl -o latest.dump `heroku pg:backups public-url -a $1`
}

alias rake="noglob rake"
alias ggpush="ggp"
alias ggpull="ggl"
alias dbimport="heroku pg:backups restore 'https://s3.amazonaws.com/d3m-misc/latest.dump' DATABASE_URL"
alias trash="rmtrash"

export HOST_URL='localhost:3000'
