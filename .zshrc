for file in ~/.{exports,aliases,functions}; do
  [ -f "$file" ] && source "$file";
done;

plugins=(
  git
  z
)

PROMPT_EOL_MARK=''
ZSH_THEME=""

source $ZSH/oh-my-zsh.sh

# Set Pure ZSH as a prompt
autoload -U promptinit; promptinit
prompt pure
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
