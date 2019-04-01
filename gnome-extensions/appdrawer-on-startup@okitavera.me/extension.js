/* App Drawer on Startup
 * Inspired by Overview on Startup (DEPRECATED)
 * |-> https://extensions.gnome.org/extension/658/overview-on-startup/
 */
const Main = imports.ui.main;

function openAppView() {
  Main.overview.viewSelector._showAppsButton.checked = true;
  return Main.overview.show();
}

function enable() {
  Main.layoutManager.connect("startup-prepared", openAppView.bind(this));
}

function disable() {}
function init() {}
