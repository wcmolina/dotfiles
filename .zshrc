# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# NPM without sudo
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export HISTTIMEFORMAT="%d/%m/%y %T "
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_191`
export CUSTOM_TOOLS="${HOME}/Tools/"
export PATH="$PATH:$JAVA_HOME/bin:${HOME}/apache-maven-3.5.4/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:${HOME}/Library/Python/2.7/bin:${HOME}/tizen-studio/tools/ide/bin"

#alias dog="pygmentize -g"
alias querytojson="node ${CUSTOM_TOOLS}/queryStringToJSON"
alias nielsenurl="node ${CUSTOM_TOOLS}/nielsenUrlDecoder"
alias ip='curl http://ifconfig.me/ip'
alias localip='ipconfig getifaddr en0'

cd() {
    builtin cd "$@" && ls -a
}

nielsen() {
    nielsenurl $1 | nvim
}

epoch() {
  date -j -f %s $(($1 / 1000))
}

mkcd() {
  mkdir -p $1; cd $1
}

plugins=(
  git
  z
  extract
)

#ZSH_THEME="spaceship"
SPACESHIP_BATTERY_SHOW=false

source $ZSH/oh-my-zsh.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
