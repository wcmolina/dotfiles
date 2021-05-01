for file in ~/.{exports,aliases,functions}; do
  [ -f "$file" ] && source "$file";
done;

plugins=(
  git
  z
  zsh-nvm
)

PROMPT_EOL_MARK=''
ZSH_THEME=""

source $ZSH/oh-my-zsh.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Set Pure ZSH as a prompt
autoload -U promptinit; promptinit
prompt pure