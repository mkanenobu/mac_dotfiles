# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash"

function command_exists() {
  type "$1" 1>/dev/null 2>/dev/null
  return $?
}

function echoerr() {
  echo "$@" 1>&2
}

# Set PATH, MANPATH, etc., for Homebrew.
if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Paths
export XDG_CONFIG_HOME="$HOME/.config"

# Path setup
# Expects generate-paths script to be in the same directory as this file.
path_generate_script_path="$(dirname "${BASH_SOURCE[0]}")/generate-paths.rb"
if [ -x "$path_generate_script_path" ]; then
  export PATH="$PATH:$(eval "$path_generate_script_path")"
else
  echoerr "Path generate script not found: $path_generate_script_path"
fi

# opam for OCaml
command_exists opam && eval "$(opam env)"

## asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
. <(asdf completion bash)

export GOPATH="$HOME/go"

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

# OpenSSL
#export PATH="$PATH:/opt/homebrew/opt/openssl@3/bin"
#export LDFLAGS="$(pkg-config --cflags openssl)"
#export CPPFLAGS="$(pkg-config --libs openssl)"
#export CGO_CFLAGS="$(pkg-config --cflags openssl)"
#export CGO_LDFLAGS="$(pkg-config --libs openssl)"

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  [[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
fi

if [ "${ALACRITTY}" = "true" ] && [ -z "${BYOUBU_CONFIG_DIR}" ]; then
  command_exists byobu && byobu
fi

# cargo
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
# Wasm Edge
[[ -f "$HOME/.wasmedge/env" ]] && . "$HOME/.wasmedge/env"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.bash 2>/dev/null || :

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash"
