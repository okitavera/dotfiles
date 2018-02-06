#!/bin/bash
#
#     ▐▘▘      ▘  ▗         ▌
# ▛▘▛▌▜▘▌▄▖▛▌▀▌▌▛▌▜▘█▌▛▘  ▛▘▛▌
# ▌ ▙▌▐ ▌  ▙▌█▌▌▌▌▐▖▙▖▌ ▗ ▄▌▌▌
#          ▌
#

source ${HOME}/.wmrc
pallete="`xrgc bg`, `xrgc 7`, `xrgc bg`, `xrgc 7`, `xrgc bg`"

cat << EOF > $HOME/.cache/rofi.Xresources
rofi.color-window: `xrgc bg`, `xrgc fg`
rofi.color-active: $pallete
rofi.color-normal: $pallete
rofi.color-urgent: $pallete
EOF

xrdb -merge $HOME/.cache/rofi.Xresources
