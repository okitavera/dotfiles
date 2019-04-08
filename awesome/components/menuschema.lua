local hotkeys_popup = require("awful.hotkeys_popup")
local menuschema = {
  items = {
    {"hotkeys", function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end},
    {"manual", glob.terminal .. " -e man awesome"},
    {"edit config", glob.editor .. " " .. awesome.conffile},
    {"restart", awesome.restart},
    {"quit", function()
      awesome.quit()
    end},
    {"open terminal", glob.terminal}
  }
}

return menuschema
