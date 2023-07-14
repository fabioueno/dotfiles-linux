#!/bin/zsh

function l() {
  if [[ "$#" -eq 1 ]]; then
    local DIRECTORY=$1
  fi

  pls $DIRECTORY --align --collapse -d perms -d user -d size -d ctime -d mtime -d atime -d git --all
}
