SUDO=true
source ./functions.sh
echo "You are running system-install.sh"
echo "This script will overwrite your system into unused environment if you're not the owner of this dotfiles."
read -p "Are you okitavera (y/n): "  REPLY
if [[ ! $REPLY =~ ^[Yy]$ ]];then
    echo "exiting"
    exit 0
elif ! grep -e vera <<< $USER >/dev/null;then
    echo "you are running this script under suspicious user. exiting"
    exit 1
fi

#-- Fonts
mkdir -p /tmp/dankmono
for i in DankMono-Italic DankMono-Regular
do
    gpg --decrypt fonts/$i.gpg > /tmp/dankmono/${i}.ttf
done
deploy /tmp/dankmono /usr/share/fonts/TTF && deploy etc /etc
