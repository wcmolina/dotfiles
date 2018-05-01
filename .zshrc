export ZSH=/home/wcmolina/.oh-my-zsh
export ANDROID_HOME=$HOME/Android/Sdk
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$PATH:$NPM_PACKAGES/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

ZSH_THEME="spaceship"
SPACESHIP_BATTERY_SHOW=false

# Because dogs are cooler than cats
alias dog='pygmentize -g'

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

plugins=(
  git
  extract
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source "/home/wcmolina/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"