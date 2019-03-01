# Antibody (https://github.com/caarlos0/antibody)
source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

# Aliases, functions, and exports
for file in ~/.{aliases,exports}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load auto completions
autoload -U compinit && compinit
zmodload -i zsh/complist

# Enable Vi mode
bindkey -v
