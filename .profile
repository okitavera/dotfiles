[[ `echo $PATH | grep $USER | wc -l` -lt 1 ]] && export PATH="${HOME}/.bin:$PATH"

export XDG_CONFIG_HOME="${HOME}/.config"

USER_G_RES_LOGO=${XDG_CONFIG_HOME}/.config/gnome-control-center/alexa.png
export G_RESOURCE_OVERLAYS=/org/gnome/control-center/info/GnomeLogoVerticalMedium.svg=$USER_G_RES_LOGO
