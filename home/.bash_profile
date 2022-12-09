# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"

function _exists() {
  type "$1" 1>/dev/null 2>/dev/null
  return $?
}

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
  fi
fi

# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.nimble/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.nodenv/bin"
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/.pyenv/bin"
export PATH="$PATH:$HOME/.nimenv/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/toolbox"
export PATH="$PATH:$HOME/.local/for-work"
export PATH="$PATH:$HOME/go/bin"
# >>> coursier install directory >>>
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
# PHP installed by homebrew
export PATH="$PATH:/usr/local/opt/php@8.0/bin"
export PATH="$PATH:/usr/local/opt/php@8.0/sbin"
# Flutter
export PATH="$PATH:$HOME/flutter/bin"

# Java
# export JAVA_HOME="$(/usr/libexec/java_home -v "11")"
# export PATH="$PATH:$JAVA_HOME/bin"

# Android SDK path
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# *env
eval "$(nodenv init -)"
eval "$(rbenv init - bash)"
eval "$(opam env)"
eval "$(pyenv init -)"

export GOPATH="$HOME/go"

# Cloud SDK
export CLOUDSDK_PYTHON="~/.pyenv/shims/python"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$PATH:$HOME/.local/bin"
fi

if [ -e "$HOME/.cargo/env" ] ; then
  source "$HOME/.cargo/env"
fi

export EDITOR=nvim
# nvim in tmux
# export TERM=xterm-256color

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
export LC_TIME=C

# ignore .DS_STORE from completion
export FIGNORE="$FIGNORE:DS_Store"

# OpenSSL
export PATH="$PATH:/usr/local/opt/openssl/bin"
# For compilers to find openssl you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# if alacritty, execute byobu
if [ "${ALACRITTY}" ] && [ -z "${BYOBU_BACKEND}" ]; then
  byobu
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"
