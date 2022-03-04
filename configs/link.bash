#!/usr/bin/env bash

set -Ceu

__DIR__() {
  dirname "$(resolve_link "${BASH_SOURCE[1]}")"
}

resolve_link() {
  local filepath="${1}"
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
  local filename="${1}"
  local source="${source_dir}/${filename}"
  local target="${XDG_CONFIG_HOME}/${filename}"

  if [ -L "${target}" ]; then
    unlink "${target}"
  elif [ -d "${target}" ]; then
    rm -rf "${target}"
  fi

  echo "${source} -> ${target}"
  ln -s ${source} ${target}
}

for dir_path in $(find ${source_dir} -depth 1); do
  dirname="$(basename "${dir_path}")"

  # skip this script
  if [ "${dirname}" == "$(basename "${0}")" ]; then
    continue
  fi

  create_symlink "${dirname}"
done
