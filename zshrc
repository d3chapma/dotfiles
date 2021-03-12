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

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Postgres.app/Contents/Versions/10/bin"

function dbpull(){
  curl -o latest.dump `heroku pg:backups public-url -a $1`
}

alias rake="noglob rake"
alias trash="rmtrash"

export EDITOR='code -w'
export HOST_URL='lvh.me:3000'
export GPG_TTY=$(tty)
export GOPATH='/Users/dc/go'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$GOPATH/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# activate nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
