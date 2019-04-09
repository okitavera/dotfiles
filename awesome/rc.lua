pcall(require, "luarocks.loader")

-- globalize system libs
awful = require("awful")
beautiful = require("beautiful")
gears = require("gears")
wibox = require("wibox")
naughty = require("naughty")
xresources = require("beautiful.xresources")
lain = require("lain")

-- setup global variables for later usage
glob = {
  aw_root = awful.util.getdir("config"),
  editor = "code",
  terminal = "urxvt",
  launcher = "rofi -show run",
  screenshot = "scrot"
}

-- initialize theme system
beautiful.init(glob.aw_root.."/themes/default/theme.lua")

-- invoke early autostart
local autostart = require("autostart")
autostart.invoke(autostart.early)

-- components
utils = require("components.utils")
dpi = require("components.utils").dpi

-- keyboard and mouse
bindings = require("components.bindings")

-- local components
local menuschema = require("components.menuschema")
local panel = require("components.panel")
local windowrules = require("components.windowrules")
local layouts = require("components.layouts")
local ponymix = require("widgets.ponymix")

-- setup global menu with menuschema
glob.menu = awful.menu(menuschema)

-- setup window rules and layouts
awful.rules.rules = windowrules
awful.layout.layouts = layouts

-- register naughty error reporter
require("components.reporter")

-- register client signals
require("components.clientsignal")

-- register hotkeys and mouse
root.keys(bindings.keys)
root.buttons(bindings.mouse)

-- setup Standalone Widget
ponymix { max_volume = 150, timeout = 0.25 }

-- set waallpaper with pywal
screen.connect_signal("property::geometry", utils.pywal.set_wallpaper)
awful.screen.connect_for_each_screen(function(s)
  utils.pywal.set_wallpaper(s)
end)

-- invoke late autostart (for GUI apps)
autostart.invoke(autostart.late)

