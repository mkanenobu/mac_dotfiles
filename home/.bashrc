# .bashrc: executed by bash(1) for non-login shells.
# vi: set tabstop=2 softtabstop=2 shiftwidth=2 :

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && . "$HOME/.fig/shell/bashrc.pre.bash"

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# use GNU commands
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

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
  PS1='\e[01;32m\]\u\e[00m\]:\e[01;34m\]\W'
  PS1="${PS1}${RETURN_CODE} "
fi

PS2='>'

function _exists() {
  type "$1" 1>/dev/null 2>/dev/null
  return $?
}

if _exists "exa"; then
  alias ls='exa -I=".DS_Store"'
  alias la='ls -a'
  alias ll='ls -lha --git'
  alias l='ls -lha --git'
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
  history -c &&
  history -r
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
alias nvr='vim ~/.config/nvim/init.vim'
alias dein='vim ~/.config/nvim/dein/.dein.toml'
alias deinlazy='vim ~/.config/nvim/dein/.dein_lazy.toml'
alias rename='rename -v'
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
alias duc='du -d 1 -ah | sort -h'
alias wcj='wc -m'
alias mv='mv -i'
alias cp='cp -i'
alias fzf='fzf --reverse'
alias cl='clear'
alias gitignore_init='gibo dump'

# languages
alias py='python3'
alias nimc='nim c'
alias nimcd='nim c -d:release'
alias nimcr='nim c -r --verbosity:0'
alias nimi='rlwrap nim secret'
alias rc='rustc'
alias ocaml='rlwrap ocaml'

# Docker
alias docker-compose='docker compose'

# Git
alias ga='git add'
alias gitpull='git pull'
alias gitpush='git push'
alias gcm='git commit -m'
alias gcd='git commit -m "$(date)"'
alias gca='git commit --amend'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdt='git difftool --extcmd="icdiff --line-numbers --unified=3" --no-prompt | less'
alias gcl='git clone'
alias gg='git log --graph --pretty=oneline'
alias gc='git checkout'
alias gb='git branch'
alias gbrm='git brand --delete'
alias gf='git fetch'
alias gpr='git pull --rebase'
alias gfp='git fetch && git pull'
alias gst='git stash'
alias gsp='git stash pop'

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

[ -f ~/.env ] && source ~/.env

# stop ctrl-s panic
stty stop undef

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# awscli default profile
export AWS_PROFILE=personal

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)); then
      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)); then

      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && . "$HOME/.fig/shell/bashrc.post.bash"

true
