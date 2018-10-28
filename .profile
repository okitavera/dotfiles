[[ -z $(echo $PATH | grep $USER) ]] && export PATH="${HOME}/.bin:$PATH"

export XDG_CONFIG_HOME="${HOME}/.config"

GNOME_LOGO=${XDG_CONFIG_HOME}/.config/gnome-control-center/alexa.png
if [[ -f GNOME_LOGO ]]; then
    export G_RESOURCE_OVERLAYS=/org/gnome/control-center/info/GnomeLogoVerticalMedium.svg=$GNOME_LOGO
fi