autoload -Uz compinit

# The following code is for caching the compiled completions and speeding up
# terminal load times. It will automatically refresh the cache when
# my .zshrc changes. This code was provided by ChatGPT.
if [[ -n ${ZSH_COMPDUMP:-} ]]; then
  compdump_file=$ZSH_COMPDUMP
else
  compdump_file=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
fi

mkdir -p "${compdump_file:h}" # ensure directory exists

if [[ ! -s $compdump_file || $compdump_file -ot ~/.zshrc ]]; then
  compinit -d "$compdump_file"
else
  compinit -C -d "$compdump_file"
fi
