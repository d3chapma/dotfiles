HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

autoload -U compinit
compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

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
alias trash="rmtrash"

export HOST_URL='lvh.me:3000'
