# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# NPM without sudo
#NPM_PACKAGES="${HOME}/.npm-packages"
#PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
#unset MANPATH # delete if you already modified MANPATH elsewhere in your config
#export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Java and Android
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_231`
#export JAVA_HOME=`/usr/libexec/java_home -v 11.0.5`

export PATH="$PATH:$JAVA_HOME/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:/usr/local/sbin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HISTTIMEFORMAT="%d/%m/%y %T "

#alias dog="pygmentize -g"
alias ip='curl http://ifconfig.me/ip'
alias localip='ipconfig getifaddr en0'
alias kbp='killByPort'

cd() {
    builtin cd "$@" && ls -a
}

epoch() {
  date -j -f %s $(($1 / 1000))
}

mkcd() {
  mkdir -p $1; cd $1
}

killByPort() {
  lsof -i tcp:$1
  lsof -i:$1 -Fp | head -n 1 | sed 's/^p//' | xargs kill
}

plugins=(
  git
  z
  extract
)

PROMPT_EOL_MARK=''
ZSH_THEME="spaceship"
#SPACESHIP_BATTERY_SHOW=false

source $ZSH/oh-my-zsh.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship