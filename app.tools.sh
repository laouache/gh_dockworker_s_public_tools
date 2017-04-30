#!/usr/bin/env bash

echo "tools verbose : $VERBOSE"

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

[ -z ${APP_CONFIGURATION_DIR+x} ] && #APP_CONFIGURATION_DIR non défini \
    [ -d ~/dockworker/docker-configurations/$USER@$HOSTNAME/ ] && #dossier existe \ 
    export APP_CONFIGURATION_DIR=~/dockworker/docker-configurations/$USER@$HOSTNAME/

[ -z ${APP_CONFIGURATION_DIR+x} ] && #APP_CONFIGURATION_DIR non défini \
    printing "APP_CONFIGURATION_DIR non existant"
[ -z ${APP_CONFIGURATION_DIR+x} ] || #APP_CONFIGURATION_DIR défini \
    printing "APP_CONFIGURATION_DIR=${APP_CONFIGURATION_DIR}"

