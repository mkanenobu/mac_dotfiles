#!/bin/sh
cols="$(tput cols)"
separater="$(echo "===================================================================================================================================" | cut -c "1-${cols}")"

separate() {
  echo
  echo "${separater}"
  echo "${1}"
  echo "${separater}"
}

separate "Nim"
choosenim update stable
nimble update

separate "Haskell"
stack update
stack upgrade

separate "Node.js"
yarn global upgrade

separate "OCaml"
opam update && opam upgrade && eval $(opam env)
