# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"

function _exists() {
  type "$1" 1>/dev/null 2>/dev/null
  return $?
}

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.nodenv/bin"
export PATH="$PATH:$HOME/.local/toolbox"
export PATH="$PATH:$HOME/.local/for-work"
export PATH="$PATH:$HOME/go/bin"
# Rancher Desktop
export PATH="$PATH:$HOME/.rd/bin"

# *env
eval "$(nodenv init -)"
eval "$(opam env)"

export GOPATH="$HOME/go"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$PATH:$HOME/.local/bin"
fi

if [ -e "$HOME/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
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
export PATH="$PATH:/usr/local/opt/openssl/bin"
# For compilers to find openssl you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
  fi
fi

[[ -f "/opt/homebrew/opt/fzf/shell/key-bindings.bash" ]] && builtin source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"

# completion
complete -C "$(which aws_completer)" aws

# if alacritty, execute byobu
if [ "${ALACRITTY}" ] && [ -z "${BYOBU_BACKEND}" ]; then
  byobu
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"
