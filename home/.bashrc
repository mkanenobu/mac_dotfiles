# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash"

case $- in
  *i*) ;;
    *) return;;
esac

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=20000

HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -u checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z $TMUX ]; then
  PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$ '
else
  RETURN_CODE='\[$(
  if [ $? -eq 0 ]; then
    echo -en \e[m\]
  else
    echo -en \e[31m\]
  fi; echo -en $\e[m\]
  )'
  PS1='\e[01;32m\][\D{%F %T}]\e[00m\]:\e[01;34m\]\W'
  PS1="${PS1}${RETURN_CODE} "
fi
PS2='>'

function _exists() {
  type "$1" 1>/dev/null 2>/dev/null
  return $?
}

if _exists "eza"; then
  alias ls='eza -I=".DS_Store"'
  alias la='ls -a'
  alias ll="ls -lha --git --sort=date --reverse --time-style='+%Y-%m-%d %H:%M'"
  alias l="ls -lha --git --sort=date --reverse --time-style='+%Y-%m-%d %H:%M'"
else
  alias la='ls -a'
  alias ll='ls -lha'
  alias l='ls -lha'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# tmux share history
function share_history {
  history -a
  tac ~/.bash_history | awk '!a[$0]++' | tac >| ~/.bash_history.tmp
  [ -f ~/.bash_history.tmp ] &&
    mv -f ~/.bash_history{.tmp,} &&
      history -c && history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

## User aliases
if _exists "nvim"; then
  alias vi='nvim'
  alias vim='nvim'
  alias n='nvim'
  alias ivm='nvim'
fi
alias br='vim ~/.bashrc'
alias bp='vim ~/.bash_profile'
alias sbp='source ~/.bash_profile'
alias sbr='source ~/.bashrc'
alias mkdir='mkdir -p'
alias nvr='vim ~/.config/nvim/'
if _exists "icdiff"; then
  alias diff='icdiff -U 1 --line-number'
fi
if _exists "bat"; then
  alias cat='bat'
fi
alias fd='fd -H'
alias rg='rg --no-ignore'
alias lame='lame -b 192'
alias vimdiff='nvim -d'
alias tree='tree -N'

# Shell utils
alias duc='du -d 1 -h | sort -h'
alias wc='wc -m'
alias wc_line='wc -l'
alias mv='mv -i'
alias cp='cp -i'
alias fzf='fzf --reverse'

alias ts="node --experimental-strip-types --no-warnings=ExperimentalWarning"

# Git
alias ga='git add'

alias gpull='git pull'
alias gpr='git pull --rebase'
alias gpush='git push'

alias gcm='git commit -m'
alias gcd='git commit -m "$(date)"'
alias gca='git commit --amend'

alias gmain='git checkout main'
alias gc='git checkout'

alias gst='git stash'
alias gsp='git stash pop'

alias gcl='git clone'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdt='git difftool --extcmd="icdiff --line-numbers --unified=3" --no-prompt | less'
alias gg='git log --graph --pretty=oneline'

alias ghpr='gh pr checkout'

# typo
alias al=':'
alias a=':'
alias .s='ls'
alias claer="clear"
alias im='vim'

shopt -s autocd
set -o emacs
# リダイレクトによる上書き禁止
# >|を用いればリダイレクトできる
set -C noclobber

[ -f "$HOME/.env" ] && source "$HOME/.env"

# rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# fzf
[[ -f "/opt/homebrew/opt/fzf/shell/key-bindings.bash" ]] && builtin source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"

# stop ctrl-s panic
stty stop undef

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# local config
[ -f "$HOME/.bashrc_local" ] && source "$HOME/.bashrc_local"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash"
