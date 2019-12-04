# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.nimble/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.nodenv/shims"
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/tools"
export PATH="$PATH:$HOME/.local/forDevelop"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="/Applications/factor:$PATH"

eval "$(nodenv init -)"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(opam env)"
eval "$(thefuck --alias)"

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


export LUA_PATH='/Users/mitsuru/.luarocks/share/lua/5.3/?.lua;/Users/mitsuru/.luarocks/share/lua/5.3/?/init.lua;/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/Cellar/luarocks/3.1.3/share/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua'
export LUA_CPATH='/Users/mitsuru/.luarocks/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;./?.so'

export PATH="$PATH:$HOME/.local/bin"
# export PATH='/Users/mitsuru/.luarocks/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/Users/mitsuru/.opam/4.08.0/bin:/Users/mitsuru/.pyenv/shims:/Users/mitsuru/.rbenv/shims:/Users/mitsuru/.nodenv/shims:/Users/mitsuru/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:/opt/X11/bin:/Applications/Wireshark.app/Contents/MacOS:/Users/mitsuru/.cache/dein/repos/github.com/junegunn/fzf/bin:/Users/mitsuru/.choosenim/toolchains/nim-0.20.0/bin:/Users/mitsuru/.nimble/bin:/Users/mitsuru/.cargo/bin:/Users/mitsuru/.rbenv/bin:/Users/mitsuru/.local/bin:/Users/mitsuru/.local/tools:/Users/mitsuru/.local/forDevelop:/Users/mitsuru/go/bin
