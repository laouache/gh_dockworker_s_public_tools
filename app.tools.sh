#!/usr/bin/env bash

echo "$VERBOSE=$VERBOSE"

function logging () {
  if [ -n "$1" ]
  then
      IN="$1"
  else
      read IN # This reads a string from stdin and stores it in a variable called IN
  fi
  if [ "$VERBOSE" = 1 ]; then
    echo -e $IN
  fi
}
export -f logging
function printing () {
  if [ -n "$1" ]
  then
      IN="$1"
  else
      read IN # This reads a string from stdin and stores it in a variable called IN
  fi
  echo -e "$IN"
}
export -f printing
function existing()
{
  command -v "$1" >/dev/null 2>&1
  # EXAMPLE
  # if existing bash; then
  #  echo 'Bash exists!'
  # else
  #  echo 'Your system does not have Bash'
  # fi
}
export -f existing
