# .bashrc: executed by bash(1) for non-login shells.
# vi: set tabstop=4 softtabstop=4 shiftwidth=4 :

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

# if GNU ls
alias ls='exa'
alias la='ls -a'
alias ll='ls -lha'
alias l='ls -lha'
# if [ "$(which ls)" == "/usr/local/opt/coreutils/libexec/gnubin/ls" ]; then
#     alias ls='ls --color=auto'
#     #alias dir='dir --color=auto'
#     #alias vdir='vdir --color=auto'
#
#     # alias grep='grep --color=auto'
#     # alias fgrep='fgrep --color=auto'
#     # alias egrep='egrep --color=auto'
# else
#     alias ls='ls -G'
# fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
# alias ll='ls -alFh'
# alias la='ls -A'
# alias l='ls -CF'

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

_exists() {
    type "$1" 1>/dev/null 2>/dev/null
    return $?
}

## User aliases
if _exists "nvim"; then
    alias vi='nvim'
    alias vim='nvim'
    alias n='nvim'
    alias ivm='nvim'
fi
alias br='vim ~/.bashrc'
alias bp='vim ~/.bash_profile'
alias bf='vim ~/.bash_functions'
alias mkdir='mkdir -p'
alias nvr='vim ~/.config/nvim/init.vim'
alias dein='vim ~/.config/nvim/dein/.dein.toml'
alias deinlazy='vim ~/.config/nvim/dein/.dein_lazy.toml'
alias sbp='source ~/.bash_profile'
alias sbr='source ~/.bashrc'
alias sbf='source ~/.bash_functions'
alias rename='rename -v'
alias xon='xonsh'
if _exists "icdiff"; then
    alias diff='icdiff -U 1 --line-number'
fi
if _exists "bat"; then
    alias cat='bat'
fi
alias ssh-pubkeygen='ssh-keygen -yf'
alias fd='fd -H'
alias rg='rg --no-ignore'
alias psfind='ps aux | fzf'
alias lame='lame -b 192'
alias vimdiff='nvim -d'

# Shell utils
alias duc='du -d 1 -ah | sort -h'
alias wcj='wc -m'
alias mv='mv -i'
alias cp='cp -i'
alias fzf='fzf --reverse'
alias cl='clear'
alias mpv='mpv --volume=70'
alias ggr='ggr.py'
if _exists "fuck"; then
    alias f='fuck'
fi

# languages
alias py='python3'
alias nimc='nim c'
alias nimcd='nim c -d:release'
alias nimcr='nim c -r --verbosity:0'
alias nimi='rlwrap nim secret'
alias rc='rustc'
alias lua='lua5.3'
alias luac='luac5.3'
alias rb='ruby'
alias buninstall='bundle install'
alias ocaml='rlwrap ocaml'
alias k='rlwrap k'

# Docker
alias docker='docker'
alias drun='docker run'
alias dps='docker ps'
alias dl='docker ps -l -q'
alias dbuild='docker build'
alias dimages='docker images'

alias dockerc='docker-compose'
alias dcbuild='docker-compose build'
alias dcup='docker-compose up -d'
alias dcps='docker-compose ps'
alias dclog='docker-compose logs'

# Git
alias ga='git add'
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

# typo
alias al=':'
alias a=':'
alias .s='ls'
alias claer="clear"
alias im='vim'

# aws
alias aws-vault-prod='aws-vault exec ih-prod'

# shopt -s autocd
set -o emacs
# リダイレクトによる上書き禁止
# >|を用いればリダイレクトできる
set -C noclobber

if [ -f ~/.bash_functions ];then
    . ~/.bash_functions
fi

if [ -f ~/.env ]; then
    . ~/.env
fi

# stop ctrl-s panic
stty stop undef

if [ -f "$HOME/.config/bash-wakatime.sh" ]; then
    source "$HOME/.config/bash-wakatime.sh"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.local/bin/git-prompt.sh ] && source ~/.local/bin/git-prompt.sh
[ -f ~/.env ] && source ~/.env
