#!/usr/bin/env bash
fun.firefox(){
  if [[ ! -d firefox ]]
  then
    echo "directory firefox doesn't exist. exiting"
    exit 1
  fi
  
  if [[ ! -f $1 ]]
  then
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
  cp -arpf firefox $HOME/.mozilla/firefox/$MOZ_PROFILE
}