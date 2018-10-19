#!/usr/bin/env bash

[[ "$@" =~ '-d' ]] && set -x

set -e
set -u

REQ=$1

function main() {
  local input=$1
  echo $(( 2 ** input ))
  return 0
}

if [[ "${REQ}" = 'total' ]]; then
  echo $REQ
elif (( 1<=REQ && REQ<=64)); then
  echo $(main $REQ)
else
  echo 'Error: invalid input' >&2
  exit 1
fi

exit 0
