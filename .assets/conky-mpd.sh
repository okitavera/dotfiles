#!/bin/sh

MPD_MUSIC_PATH="${HOME}/Music"
TMP_COVER_PATH="/tmp/mpd-track-cover"

[[ ! -f '/tmp/mpd-coverbg.png' ]] && convert -size 1x1 xc:#EFEFEF /tmp/mpd-coverbg.png
exiftool -b -Picture "$MPD_MUSIC_PATH/$(mpc --format "%file%" current)" > "$TMP_COVER_PATH"
