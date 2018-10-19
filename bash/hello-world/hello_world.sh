#!/usr/bin/env bash

[[ "$@" =~ '-d' ]] && set -x

set -e
set -u

main() {
  echo 'Hello, World!'
  return 0
}

main "$@"

exit 0
