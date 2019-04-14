#!/bin/bash
SCRIPTPATH="$(readlink -f $0 | xargs dirname)"

RED='\033[0;41;30m'
STD='\033[0;0;39m'

trap '' SIGINT SIGQUIT SIGTSTP
log()(printf "${FUNCNAME[1]}: $1\n")
deploy(){
  [[ -d "$1" ]] || { log "directory $1 doesn't exist. exiting"; exit 1; }
  [[ -d "$2" ]] || mkdir -p "$2"
  log "copying modules $1 to $2"
  [[ "$SUDO" == "true" ]] && \
    sudo cp -af --preserve=mode "$1/." "$2" || cp -af --preserve=mode "$1/." "$2"
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
  cp -af "$1/." $HOME/.mozilla/firefox/$MOZ
}
okitacheck(){
  echo "This script will overwrite your system into unused environment if you're not the owner of this dotfiles."
  read -p "Are you okitavera (y/n): "  REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]];then
      echo "exiting"
      exit 0
  elif ! grep -e vera <<< $USER >/dev/null;then
      echo "you are running this script under suspicious user. exiting"
      exit 1
  fi
}

pause(){
  read -p "Press [Enter] key to continue..." e
}

userdots(){
  SUDO=false
  pushd $SCRIPTPATH
  source user.conf
  popd
}

systemdots(){
  SUDO=true
  pushd $SCRIPTPATH
  source system.conf
  popd
}

choices(){
	local choice
	read -p "choose > " choice
	case $choice in
		1) userdots; pause ;;
		2) systemdots; pause ;;
		*) exit 0;;
	esac
}

while true
do
	echo
	echo "bootstrap script for okitavera's dotfiles"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1: Install user dotfiles"
	echo "2: Install system dotfiles"
	echo "*: Quit"
	choices
done
