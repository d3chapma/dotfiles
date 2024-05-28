HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=100000

# Various ENV Config
export EDITOR=zed

# COLOR LS OUTPUT
export CLICOLOR=1

# Pinentry for GPG
export GPG_TTY=$(tty)

source $HOME/Personal/dotfiles/zsh/asdf.sh
source $HOME/Personal/dotfiles/zsh/android.sh
source $HOME/Personal/dotfiles/zsh/python.sh
source $HOME/Personal/dotfiles/zsh/direnv.sh
source $HOME/Personal/dotfiles/zsh/go.sh
source $HOME/Personal/dotfiles/zsh/functions_git.sh
source $HOME/Personal/dotfiles/zsh/aliases_d3m.sh
source $HOME/Personal/dotfiles/zsh/aliases_git.sh
source $HOME/Personal/dotfiles/zsh/aliases_vpn.sh
source $HOME/Personal/dotfiles/zsh/aliases_misc.sh
source $HOME/Personal/dotfiles/zsh/prompt.sh
source $HOME/Personal/dotfiles/zsh/fzf.sh
source $HOME/Personal/dotfiles/zsh/postgres.sh
