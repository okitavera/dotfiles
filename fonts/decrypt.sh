#!/usr/bin/env bash
SCRIPTPATH="$(readlink -f $0 | xargs dirname)"
DEST=/usr/share/fonts/TTF
sudo mkdir -p "$DEST"
for i in DankMono-Italic DankMono-Regular; do
  gpg --decrypt "$SCRIPTPATH/$i.gpg" | sudo tee "$DEST/$i.ttf" >/dev/null
done
sudo fc-cache -vf
fc-cache -vf
