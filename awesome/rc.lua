pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- register naughty error reporter
require("components.reporter")

-- setup global(rc) variables for later usage
conf = {
  aw_root = awful.util.getdir("config"),
  editor = "code",
  terminal = "urxvt",
  launcher = "rofi -show run",
  screenshot = "scrot"
}

-- invoke xdg autostart ()
if not conf.awesome_started then
  awful.spawn("dex --autostart --environment Awesome", false)
  conf.awesome_started = true
end

-- initialize theme system and pywal
local pywal = require("components.pywal")
pywal.restore()
beautiful.init(conf.aw_root.."/themes/default/theme.lua")

local bindings = require("components.bindings")
local menuschema = require("components.menuschema")
local panel = require("components.panel")
local windowrules = require("components.windowrules")
local layouts = require("components.layouts")

-- setup conf.l menu with menuschema
conf.menu = awful.menu(menuschema)

-- setup window rules and layouts
awful.rules.rules = windowrules
awful.layout.layouts = layouts

-- register hotkeys and mouse
root.keys(bindings.keys)
root.buttons(bindings.mouse)

-- set waallpaper with pywal
screen.connect_signal("property::geometry", pywal.set_wallpaper)
awful.screen.connect_for_each_screen(function(s)
  pywal.set_wallpaper(s)
end)

-- register client signals
require("components.clientsignal")

--[[
  reload compton on every wallpaper changed
  ----
  this workaround is to force-update the "awesome.composite_manager_running" value
  for true-transparency capability in wibox.drawable
]]-- 

awesome.connect_signal("wallpaper_changed", function()
  awful.spawn.with_shell("pkill compton; compton")
end)