const St = imports.gi.St;
const Main = imports.ui.main;

let msg = null;
let iconAva = null;
let userData = null;
const avatarSize = 92;

const init = () => {
  let user = imports.gi.GLib.get_user_name();
  userData = imports.gi.AccountsService.UserManager.get_default().get_user(
    user
  );
  userData.connect("notify::is-loaded", update.bind(this));
  userData.connect("changed", update.bind(this));

  let text = new St.Bin();
  let icon = new St.Bin({
    style_class: "welcome-icon--wrapper",
    width: avatarSize + 20,
    height: avatarSize + 20
  });

  const _capitalize = T => T && T[0].toUpperCase() + T.slice(1);

  text.add_actor(
    new St.Label({
      style_class: "welcome-msg",
      text: `Welcome back, ${_capitalize(user)}!`
    })
  );

  iconAva = new St.Bin({
    style_class: "welcome-icon",
    width: avatarSize,
    height: avatarSize
  });

  icon.add_actor(iconAva);

  msg = new St.BoxLayout({
    vertical: false
  });
  msg.add_child(icon);
  msg.add_child(text);
  msg.set_position(
    msg.width / 2,
    Main.layoutManager.primaryMonitor.height / 2 - msg.height
  );
  update();
};

const update = () => {
  if (userData.get_icon_file() != null)
    iconAva.style = `background-image: url("${userData.get_icon_file()}");`;
};

const enable = () => {
  Main.uiGroup.add_actor(msg),
    imports.ui.tweener.addTween(msg, {
      opacity: 0,
      time: 0.5,
      delay: 2,
      transition: "easeIn",
      onCompvare: disable
    });
};

const disable = () => {
  Main.uiGroup.remove_actor(msg);
  msg = null;
  iconAva = null;
  userData = null;
};
