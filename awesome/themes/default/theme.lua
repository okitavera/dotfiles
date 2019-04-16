---------------------------
-- Default awesome theme --
---------------------------
local theme = {}
local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi
local pywal = require("components.pywal")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "/themes/"

theme.wallpaper = pywal.wallpaper
theme.font = "SFNS Display Bold 8"

theme.bg_normal = pywal.background
theme.bg_focus = pywal.color1
theme.bg_urgent = pywal.color1
theme.bg_minimize = pywal.background
theme.bg_systray = pywal.background

theme.fg_normal = "#aaaaaa"
theme.fg_focus = pywal.foreground
theme.fg_urgent = pywal.foreground
theme.fg_minimize = pywal.foreground

theme.useless_gap = dpi(10)
theme.border_width = dpi(0)
theme.border_normal = pywal.background
theme.border_focus = pywal.color1
theme.border_marked = "#91231c"
theme.border_radius = dpi(9)

theme.titlebar_height = dpi(30)
theme.wibar_height = dpi(30)
theme.wibar_corner_radius = dpi(25)

theme.titlebar_bg_focus = pywal.background .. "aa"
theme.titlebar_bg_normal = pywal.background .. "aa"

local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

theme.tasklist_bg_normal = pywal.foreground .. "11"
theme.tasklist_bg_minimize = pywal.foreground .. "11"
theme.tasklist_bg_focus = pywal.color1
theme.tasklist_bg_urgent = pywal.color1

theme.menu_height = dpi(24)
theme.menu_width = dpi(100)

theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"

theme.icon_theme = nil

theme.notification_border_width = 0
theme.notification_bg = theme.bg_normal
theme.notification_border_color = theme.bg_normal
theme.notification_width = dpi(200)
theme.notification_max_width = dpi(250)
theme.notification_shape = function(cr, w, h)
  gears.shape.rounded_rect(cr, w, h, 6)
end
return theme
