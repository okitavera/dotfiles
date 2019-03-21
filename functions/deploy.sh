#!/usr/bin/env bash
cR=`tput setaf 1`
c0=`tput sgr0`

fun.deploy(){
  if [[ ! -d $1 ]]
  then
    echo "deploy: directory ${cR}$1${c0} doesn't exist. exiting"
    exit 1
  fi
  
  mkdir -p $2
  echo "deploy: ${cR}$1${c0}: checking conflicted files"
  for file in `stow -n $1 -t $2 2>&1 | grep 'link nor' | sed -e 's/.*: //'`
  do
    echo "deploy: ${cR}$1${c0}: cleaning up $file"
    rm $2/$file
  done
  echo "deploy: ${cR}$1${c0}: installing to $2"
  stow $1 -t $2
}
