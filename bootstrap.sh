#!/usr/bin/env bash
set -o monitor
trap '' CHLD
for i in functions/*
do
  source $i
done

# regular package
fun.deploy audio $HOME &
fun.deploy home $HOME &
# special package
fun.deploy gnome-extensions $HOME/.local/share/gnome-shell/extensions &
fun.deploy themes $HOME/.themes &
fun.deploy bin $HOME/.local/bin &
fun.deploy conky $HOME/.conky/okitavera-conky &
# install firefox profile
fun.firefox $HOME/.mozilla/firefox/profiles.ini &

wait