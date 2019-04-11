local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local self = {
  items = {
    {"hotkeys", function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end},
    {"manual", conf.terminal .. " -e man awesome"},
    {"edit config", conf.editor .. " " .. awesome.conffile},
    {"restart", awesome.restart},
    {"quit", function()
      awesome.quit()
    end},
    {"open terminal", conf.terminal}
  }
}

return self
