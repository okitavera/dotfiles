#!/usr/bin/env bash
LIST=todo.dots.sh

log()(printf "${FUNCNAME[1]}: $1\n")

deploy(){
  [[ -d "$1" ]] || { log "directory $1 doesn't exist. exiting"; exit 1; }
  log "copying modules $1 to $2"
  cp -apf "$1/." "$2"
}

dotfox(){
  [[ -d "$1" ]] || { log "directory firefox doesn't exist. exiting"; exit 1; }
  
  if [[ ! -f "$2" ]]; then
    log "no firefox profile detected, creating a new ones"
    mkdir -p $HOME/.mozilla/firefox/
    printf '%s\n'\
      "[General]"\
      "StartWithLastProfile=1"\
      "[Profile0]"\
      "Name=default"\
      "IsRelative=1"\
      "Path=00000001.default"\
      "Default=1" > $2
  fi
  
  MOZ=`awk '/\[/{prefix=$0; next} $1{print prefix $0}' "$2" | grep Path | sed -e 's/.*Path=//g'`
  log "copying modules to $HOME/.mozilla/firefox/$MOZ"
  cp -apf "$1/." $HOME/.mozilla/firefox/$MOZ
}

source $LIST
