#!/usr/bin/env bash
LIST=todo.dots.sh

deploy(){
  cR=`tput setaf 1`
  c0=`tput sgr0`
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

dotfox(){
  if [[ ! -d firefox ]]
  then
    echo "directory firefox doesn't exist. exiting"
    exit 1
  fi
  
  if [[ ! -f $1 ]]
  then
    echo "dotfox: no firefox profile detected, creating a new ones"
    mkdir -p $HOME/.mozilla/firefox/
    echo "[General]"              >$1
    echo "StartWithLastProfile=1" >>$1
    echo "[Profile0]"             >>$1
    echo "Name=default"           >>$1
    echo "IsRelative=1"           >>$1
    echo "Path=00000001.default"  >>$1
    echo "Default=1"              >>$1
  fi
  
  MOZ_PROFILE=`awk '/\[/{prefix=$0; next} $1{print prefix $0}' $1 | grep Path | sed -e 's/.*Path=//g'`
  echo "dotfox: copying modules to $HOME/.mozilla/firefox/$MOZ_PROFILE"
  cp -arpf firefox $HOME/.mozilla/firefox/$MOZ_PROFILE
}

source $LIST
