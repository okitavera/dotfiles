local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local lfs = require("lfs")

local colorfile = gears.filesystem.get_xdg_cache_home() .. "/wal/colors.lua"
local self = {
	foreground = "#f4ecdf",
	background = "#14121b",
	color0 = "#14121b",
	color1 = "#CC424B",
	color2 = "#F09B70",
	color3 = "#5B4692",
	color4 = "#BA5793",
	color5 = "#E7A69A",
	color6 = "#FBD6A0",
	color7 = "#f4ecdf",
	color8 = "#aaa59c",
	color9 = "#CC424B",
	color10 = "#F09B70",
	color11 = "#5B4692",
	color12 = "#BA5793",
	color13 = "#E7A69A",
	color14 = "#FBD6A0",
	color15 = "#f4ecdf",
}

if lfs.attributes(colorfile) then
  self = dofile(colorfile)
end

self.restore = function()
	awful.spawn("wal -R", false)
end

self.set_wallpaper = function()
  if lfs.attributes(self.wallpaper) then
    gears.wallpaper.maximized(self.wallpaper, nil, false)
  end
end

return self
