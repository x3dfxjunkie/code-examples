#!/usr/bin/env bash

[[ "$@" =~ '-d' ]] && set -x

set -e
set -u

REQ=$1

function main() {
  local input=$1
  input=$(( input - 1 ))
  echo "2^${input}" | bc
  return 0
}

if [[ "${REQ}" = 'total' ]]; then
  declare -i total=0
  declare -a square=()
  for i in {1..64}; do
    square[$i]=$(main $i)
    # total=$(echo "${total} + ${next#-}" | bc )
  done
  echo ${square[@]} | awk '{sum=0; for (i=1; i<=NF; i++) { sum+= $i } print sum}'
elif (( 1<=REQ && REQ<=64)); then
  echo $(main $REQ)
else
  echo 'Error: invalid input' >&2
  exit 1
fi

exit 0
