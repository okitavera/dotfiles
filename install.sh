source ./functions.sh

deploy audio $HOME
deploy home $HOME
deploy gnome-extensions $HOME/.local/share/gnome-shell/extensions
deploy themes $HOME/.themes
deploy bin $HOME/.local/bin
deploy conky $HOME/.conky/okitavera-conky
dotfox firefox $HOME/.mozilla/firefox/profiles.ini
deploy vscode "$HOME/.config/Code - OSS/User"

#-- Dangerous section!
#-- Disabled by default 
# SUDO=true deploy etc /etc

#-- Fonts
for i in DankMono-Italic DankMono-Regular
do
    gpg --decrypt fonts/$i.gpg > $HOME/.fonts/${i}.ttf
done
