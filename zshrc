HISTSIZE=1000000
HISTFILE=~/.zsh_history
SAVEHIST=1000000
setopt share_history

# Various ENV Config
export EDITOR=nvim

# COLOR LS OUTPUT
export CLICOLOR=1

# Pinentry for GPG
export GPG_TTY=$(tty)

# Force emacs mode. If EDITOR contains 'vi', will default to vi mode.
bindkey -e

# Autocompletion
autoload -Uz compinit && compinit

# generally aliases should come first
source $HOME/code/d3chapma/dotfiles/zsh/aliases_d3m.sh
source $HOME/code/d3chapma/dotfiles/zsh/aliases_git.sh
source $HOME/code/d3chapma/dotfiles/zsh/aliases_vpn.sh
source $HOME/code/d3chapma/dotfiles/zsh/aliases_misc.sh
source $HOME/code/d3chapma/dotfiles/zsh/aliases_kitty.sh

source $HOME/code/d3chapma/dotfiles/zsh/functions_git.sh
source $HOME/code/d3chapma/dotfiles/zsh/asdf.sh
source $HOME/code/d3chapma/dotfiles/zsh/android.sh
source $HOME/code/d3chapma/dotfiles/zsh/python.sh
source $HOME/code/d3chapma/dotfiles/zsh/direnv.sh
source $HOME/code/d3chapma/dotfiles/zsh/go.sh
source $HOME/code/d3chapma/dotfiles/zsh/prompt.sh
source $HOME/code/d3chapma/dotfiles/zsh/fzf.sh
source $HOME/code/d3chapma/dotfiles/zsh/fzf-git.sh
source $HOME/code/d3chapma/dotfiles/zsh/postgres.sh
source $HOME/code/d3chapma/dotfiles/zsh/keybindings.sh
