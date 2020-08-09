#!/usr/bin/env bash

set -Ceu

__DIR__() {
  dirname "$(resolve_link "${BASH_SOURCE[1]}")" # 間違い 9/30　修正
}

resolve_link() {
  local filepath="$1"
  local filename
  (
    while [ "${filepath}" != "" ]; do
      cd "$(dirname "${filepath}")"
      filename="$(basename "${filepath}")"
      filepath="$(readlink "${filename}" || :)"
    done
    echo "$(pwd -P)/$filename"
  )
}

source_dir="$(__DIR__)"

create_symlink() {
  local filename="$1"
  echo "${source_dir}/${filename} -> ${XDG_CONFIG_HOME}/${filename}"
  ln -s "${source_dir}/${filename}" "${XDG_CONFIG_HOME}/${filename}"
}

for dir_path in "${source_dir}/"*; do
  dirname="$(basename "${dir_path}")"
  create_symlink "${dirname}"
done
