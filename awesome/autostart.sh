#!/usr/bin/env sh
pkill compton
compton &
wal -R &
xrdb ~/.Xresources &
