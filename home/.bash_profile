# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"

function command_exists() {
  type "$1" 1>/dev/null 2>/dev/null
  return $?
}

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.nimble/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.nodenv/bin"
export PATH="$PATH:$HOME/.local/toolbox"
export PATH="$PATH:$HOME/.local/for-work"
export PATH="$PATH:$HOME/.fig/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/flutter/bin"
# Rancher Desktop
export PATH="$PATH:$HOME/.rd/bin"
# Android
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
# GCP
export PATH="$PATH:$HOME/google-cloud-sdk/bin"

# *env
command_exists nodenv && eval "$(nodenv init -)"
command_exists opam && eval "$(opam env)"
command_exists pyenv && eval "$(pyenv init -)"
command_exists rbenv && eval "$(rbenv init -)"
command_exists pk && eval "$(pk init)"

export GOPATH="$HOME/go"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$PATH:$HOME/.local/bin"
fi

export EDITOR=nvim

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
export PATH="$PATH:/opt/homebrew/opt/openssl@3/bin"
export LDFLAGS="$(pkg-config --cflags openssl)"
export CPPFLAGS="$(pkg-config --libs openssl)"
export CGO_CFLAGS="$(pkg-config --cflags openssl)"
export CGO_LDFLAGS="$(pkg-config --libs openssl)"

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
  fi
fi

# completion
complete -C "$(which aws_completer)" aws

# if alacritty, execute byobu
if [ "${ALACRITTY}" ] && [ -z "${BYOBU_BACKEND}" ]; then
  byobu
fi

. "$HOME/.cargo/env"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.bash 2>/dev/null || :

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"

