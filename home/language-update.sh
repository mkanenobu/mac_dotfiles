#!/bin/sh
cols="$(tput cols)"
separater="$(echo "===================================================================================================================================" | cut -c "1-${cols}")"

separate() {
  echo "${separater}"
  echo "${1}"
  echo "${separater}"
}

separate "Node.js"
npm update --global

separate "Rust"
rustup update

separate "OCaml"
opam update && opam upgrade && eval $(opam env)
