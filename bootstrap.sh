#!/bin/bash
SCRIPTPATH="$(readlink -f $0 | xargs dirname)"

log(){
  printf "${FUNCNAME[1]}: $1\n"
}
deploy(){
  [[ "$3" == "--sudo" ]] && PRESX="sudo" || PRESX=""
  [[ -d "$1" ]] || { log "directory $1 doesn't exist. exiting"; exit 1; }
  [[ -d "$2" ]] || $PRESX mkdir -p "$2"
  log "copying modules $1 to $2"
  $PRESX cp -af --preserve=mode "$1/." "$2"
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
loadcfg(){
  printf "\033[1A\033[2K---\n\n"
  command pushd "$SCRIPTPATH" >/dev/null
  source $1
  command popd >/dev/null
  read -p "Press [Enter] key to continue..." e
  printf "\033[1A\033[2K\n"
}
trizen_install(){
  tempdir="/tmp/dotfiles-$USER/trizen"
  command -v git >/dev/null || sudo pacman -S git
  [[ -d "$tempdir" ]] && rm -rf "$tempdir"
  mkdir -p "$tempdir"
  git clone https://aur.archlinux.org/trizen.git "$tempdir"
  command pushd "$tempdir" >/dev/null
  makepkg -srif
  command popd >/dev/null
  rm -rf $tempdir
  unset tempdir
}

echo "bootstrap script for okitavera's dotfiles"
while true; do
cat <<EOF
---
1: Deploy complete user configurations
2: Deploy CLI-only user configurations
3: Deploy system-wide configurations
4: Install AUR helper (trizen)
*: quit
EOF
  read -p "choose > " choice
  case $choice in
    1) loadcfg user.conf ;;
    2) loadcfg user-cli-only.conf ;;
    3) loadcfg system.conf ;;
    4) trizen_install ;;
    *) exit 0;;
  esac
done
