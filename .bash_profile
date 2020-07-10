# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
  fi
fi

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.nimble/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.nodenv/bin"
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/tools"
export PATH="$PATH:$HOME/.local/docker-shorthands"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
# Coursier (package manager for Scala)
export PATH="$PATH:/Users/kanenobu/Library/Application Support/Coursier/bin"
export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
export PATH=${JAVA_HOME}/bin:${PATH}

eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(opam env)"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

export AWS_VAULT_KEYCHAIN_NAME=login

export EDITOR=nvim
# nvim in tmux
# export TERM=xterm-256color

# Android SDK path
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

## LANG settings
export LC_NUMERIC=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_MONETARY=ja_JP.UTF-8
export LC_PAPER=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8
export LC_ADDRESS=ja_JP.UTF-8
export LC_TELEPHONE=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_IDENTIFICATION=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export PAPERSIZE=a4
export LANGUAGE=en_US
export LANG=ja_JP.UTF-8
## ls sorting
#export LC_COLLATE=C
export LC_TIME=C
#
#export HISTTIMEFORMAT='%F %T '

## less coloring
# export LESS_TERMCAP_mb=$'\e[1;32m'
# export LESS_TERMCAP_md=$'\e[1;32m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[01;33m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[1;4;31m'

# ignore .DS_STORE from completion
export FIGNORE="$FIGNORE:DS_Store"

# OpenSSL
export PATH="$PATH:/usr/local/opt/openssl/bin"
# For compilers to find openssl you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
