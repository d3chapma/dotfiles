HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

autoload -Uz compinit && compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

source $HOME/Projects/dotfiles/zsh/git_functions.sh
source $HOME/Projects/dotfiles/zsh/aliases
source $HOME/Projects/dotfiles/zsh/functions
source $HOME/Projects/dotfiles/zsh/prompt

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Postgres.app/Contents/Versions/9.6/bin"

alias gf='git fetch -p'
function dbpull(){
  curl -o latest.dump `heroku pg:backups public-url -a $1`
}

alias rake="noglob rake"
alias trash="rmtrash"

export HOST_URL='lvh.me:3000'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
