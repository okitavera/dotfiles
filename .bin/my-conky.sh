#!/bin/sh
if [[ "`pidof conky | wc -l`" == "1" ]]; then
	killall conky
fi
sleep 1
conky -c ~/.assets/conky-photo.rc
conky -c ~/.assets/conky-clock.rc
