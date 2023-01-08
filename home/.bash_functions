#!/bin/bash

# unar extract multiple files
mnar(){
  for i in "$@"; do
    unar "$i"
  done
}

# Translate
dict(){
  if [ -e ~/Documents/gene-utf8.txt ]; then
    if [ -z "$1" ]; then
      exit 1
    fi
    if expr "$1" : '[a-zA-Z]*' >/dev/null ;then
      grep "$1" "${HOME}/Documents/gene-utf8.txt" -A 1  -wi --color
    else
      grep "$1" "${HOME}/Documents/gene-utf8.txt" -B 1  -wi --color
    fi
  else
    curl http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz >> ~/Downloads/gene95.tar.gz && tar xfvz ~/Downloads/gene95.tar.gz -C ~/Downloads && nkf ~/Downloads/gene.txt > ~/Documents/gene-utf8.txt
  fi
}

convertToUtf-8(){
  find . -type f -exec nkf -w -Lu --overwrite {} \;
}

git_remove_from_remote(){
  git rm --cached -r "$@"
}

# show parent branch
gp(){
  git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -1 | awk -F'[]~^[]' '{print $2}'
}

jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}
