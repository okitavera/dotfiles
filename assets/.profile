[[ -z $(echo $PATH | grep $USER) ]] && export PATH="${HOME}/.bin:${HOME}/.local/node/bin:$PATH"

export XDG_CONFIG_HOME="${HOME}/.config"
export OCL_ICD_VENDORS=mesa
wal -R &
