source ./functions.sh

deploy audio $HOME
deploy home $HOME
deploy gnome-extensions $HOME/.local/share/gnome-shell/extensions
deploy themes $HOME/.themes
deploy bin $HOME/.local/bin
deploy conky $HOME/.conky/okitavera-conky
dotfox firefox $HOME/.mozilla/firefox/profiles.ini
deploy vscode "$HOME/.config/Code - OSS/User"
SUDO=true deploy etc /etc