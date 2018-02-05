#!/bin/bash
#
#     ▐▘▘      ▘  ▗         ▌
# ▛▘▛▌▜▘▌▄▖▛▌▀▌▌▛▌▜▘█▌▛▘  ▛▘▛▌
# ▌ ▙▌▐ ▌  ▙▌█▌▌▌▌▐▖▙▖▌ ▗ ▄▌▌▌
#          ▌
#

source ${HOME}/.wmrc
pallete="`xrdb_get_color bg`, `xrdb_get_color 7`, `xrdb_get_color bg`, `xrdb_get_color 7`, `xrdb_get_color bg`"

cat << EOF > $HOME/.cache/rofi.Xresources
rofi.color-window: `xrdb_get_color bg`, `xrdb_get_color fg`
rofi.color-active: $pallete
rofi.color-normal: $pallete
rofi.color-urgent: $pallete
EOF

xrdb -merge $HOME/.cache/rofi.Xresources
