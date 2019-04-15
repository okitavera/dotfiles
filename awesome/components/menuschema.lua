local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
return {
  items = {
    {"hotkeys", function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end},
    {"manual", conf.app.term .. " -e man awesome"},
    {"edit config", conf.app.editor .. " " .. awesome.conffile},
    {"restart", awesome.restart},
    {"open terminal", conf.app.term},
    {"logout", conf.app.logout},
  }
}
