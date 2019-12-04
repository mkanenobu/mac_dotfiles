#!/bin/bash

sshToEc2(){
  . ~/.env
  ssh -i "${ec2_key}" ec2-user@"$1"
}

bunexec() {
  rerun "bundle exec ${1}"
}

dash() {
  query="${1}"
  if [ "$#" -gt 1 ]; then
    query="${1}:${2}"
  fi
  open "dash://${query}"
}

# Docker
dremove(){
  if [ "$#" != 0 ]; then
    sudo docker rm "$@"
  else
    container_id="$(sudo docker ps -a | sed -e '1d' | fzf | cut -d " " -f 1)"
    sudo docker rm "$container_id"
  fi
}

dkill(){
  if [ "$#" != 0 ]; then
    sudo docker kill "$@"
  else
    container_id="$(sudo docker ps | sed -e '1d' | fzf | cut -d " " -f 1)"
    sudo docker kill "$container_id"
  fi
}

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

gen_flowtype(){
  exec_path="$(nodenv which swagger-to-flowtype)"
  ${exec_path} -l --check-required openapi/frontend/openapi.yml -d server/frontend/app/flowtype/flowtype.js
}
