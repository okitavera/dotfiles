#!/usr/bin/env bash
SCRIPTPATH="$(readlink -f $0 | xargs dirname)"
mkdir -p /tmp/dankmono
for i in DankMono-Italic DankMono-Regular
do
    gpg --decrypt $SCRIPTPATH/$i.gpg > /tmp/dankmono/${i}.ttf
done
