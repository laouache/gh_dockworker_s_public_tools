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
function existing_command()
{
  command -v "$1" >/dev/null 2>&1
  # EXAMPLE
  # if existing_command bash; then
  #  echo 'Bash exists!'
  # else
  #  echo 'Your system does not have Bash'
  # fi
}
export -f existing_command
function existing_file()
{
  [ -f "$1" ]
  # EXAMPLE
  # if existing_file bash.sh; then
  #  echo 'file bash.sh exists!'
  # else
  #  echo 'file bash.sh does not exists'
  # fi
}
export -f existing_file


