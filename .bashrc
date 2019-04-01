# .bashrc: executed by bash(1) for non-login shells.
# vi: set tabstop=4 softtabstop=4 shiftwidth=4 :

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -u checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# if return error, change prompt color
# RETURN_CODE='\[$(
# if [ $? == "0" ]; then
#     echo -en \e[m\]
# else
#     echo -en \e[31m\]
# fi; echo -en $\e[m\]; )\]'

# simple
PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]'

# without username
# PS1='\[\033[01;34m\]\W\[\033[00m\]'

# Display branch name (not display if master master)
# BRANCH_NAME_RETURN_CODE='\[$(
# return_code=$?
# if [ -n "$(__git_ps1)" ] && [ "$(__git_ps1)" != " (master)" ]; then
#     branch_name="$(__git_ps1)"
#     echo -en \e[m\]"${branch_name// /}"
# fi
# # return code
# if [ $return_code -eq 0 ]; then
#     echo -en \e[m\]
# else
#     echo -en \e[31m\]
# fi; echo -en $\e[m\]
# )\]'
# PS1='\e[01;32m\]\u\e[00m\]:\e[01;34m\]\W' #\[\033[00m\]' #$(__git_ps1)\[\033[00m\]'
# PS1="${PS1}${BRANCH_NAME_RETURN_CODE} "
PS2='>'

if [ -z $TMUX ]; then
    PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$ '
fi

# enable color support of ls and also add handy aliases
if [ -x dircolors ]; then
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if _exists "nvim" ; then
    alias vi='nvim'
    alias vim='nvim'
    alias n='nvim'
fi
alias br='vim ~/.bashrc'
alias bf='vim ~/.bash_functions'
alias mkdir='mkdir -p'
alias nvr='vim ~/.config/nvim/init.vim'
alias dein='vim ~/.config/nvim/dein/.dein.toml'
alias deinlazy='vim ~/.config/nvim/dein/.dein_lazy.toml'
alias sbr='source ~/.bash_profile'
alias sbf='source ~/.bash_functions'
alias rename='rename -v'
if _exists "icdiff" ; then
    alias diff='icdiff -U 1 --line-number'
fi
if _exists "bat" ; then
    alias cat='bat'
fi
alias opn='open'
alias ssh-pubkeygen='ssh-keygen -yf'
alias op='open'
alias fd='fd -H'
alias psfind='ps aux | fzf'
alias lame='lame -b 192'
alias vimdiff='nvim -d'

# Shell utils
alias duc='du -d 1 -h | sort -h'
alias wcj='wc -m'
alias mv='mv -i'
alias cp='cp -i'
alias fzf='fzf --reverse'
alias cd..='cd ../'
alias log='tail -f'

# languages
alias py='python3'
alias nimc='nim c'
alias nimcd='nim c -d:release'
alias nimcr='nim c -r --verbosity:0'
alias nimi='nim secret'
alias rc='rustc'
alias lua='lua5.3'
alias luac='luac5.3'
alias rb='ruby'
alias buninstall='bundle install'

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
alias g='git'
alias ga='git add'
alias gcm='git commit -m'
alias gcd='git commit -m "$(date "+%D %R")"'
alias gs='git status'
alias gp='git pull'
alias gd='git diff'
alias gcl='git clone'
alias gg='git grep'
alias gc='git checkout'
alias gb='git branch'
alias gbrm='git brand --delete'
alias gf='git fetch'
alias gfp='git fetch && git pull'
alias gst='git stash'
alias gsp='git stash pop'

# typo
alias al='sl -e'
alias a=':'
alias sl='sl -e'
alias .s='ls'
alias claer="clear"
alias im='vim'

shopt -s autocd
set -o emacs
# リダイレクトによる上書き禁止
# >|を用いればリダイレクトできる
set -C noclobber

if [ -f ~/.bash_functions ];then
    . ~/.bash_functions
fi

# stop ctrl-s panic
stty stop undef

if [ -f "$HOME/.config/wakatime/bash-wakatime.sh" ]; then
    source "$HOME/.config/wakatime/bash-wakatime.sh"
fi

