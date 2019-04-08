local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local border_radius = beautiful.border_radius or dpi(5)

local visual = {
  progress_bar = wibox.widget {
    max_value = 150,
    widget = wibox.widget.progressbar,
    shape = function(cr, w, h)
      gears.shape.rounded_rect(cr, w, h, (border_radius * 2))
    end,
    background_color = beautiful.fg_normal,
    color = beautiful.bg_focus,
    forced_width = dpi(140)
  },
  progress_text = wibox.widget {
    id = "progresstext",
    widget = wibox.widget.textbox,
    align = "center",
    valign = "center"
  }
}

local popup = awful.popup {
  widget = {
    {
      {
        {
          visual.progress_bar,
          direction = "east",
          layout = wibox.container.rotate
        },
        left = dpi(10),
        right = dpi(10),
        widget = wibox.container.margin
      },
      {
        visual.progress_text,
        top = dpi(10),
        widget = wibox.container.margin
      },
      forced_width = dpi(50),
      layout = wibox.layout.fixed.vertical
    },
    top = dpi(20),
    left = dpi(10),
    right = dpi(10),
    bottom = dpi(20),
    widget = wibox.container.margin
  },
  placement = function(cr)
    awful.placement.right(cr, {margins = dpi(30)})
  end,
  shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, border_radius)
  end,
  visible = false,
  ontop = true,
  hide_on_right_click = true
}

local volume = function(method, num, max)
  spawn.easy_async("ponymix " .. method .. " " .. num .. " --max-volume " .. max, function(stdout)
      local result = tonumber(stdout)
      visual.progress_bar.value = result
      visual.progress_bar.max_value = max
      visual.progress_text.markup = result .. "%"
  end)
end

return function(table)
  awful.keygrabber {
    export_keybindings = true,
    allowed_keys = {
      "XF86AudioRaiseVolume",
      "XF86AudioLowerVolume"
    },
    keybindings = {
      {{}, "XF86AudioRaiseVolume", function() volume("increase", 10, table.max_volume or 100) end},
      {{}, "XF86AudioLowerVolume", function() volume("decrease", 10, table.max_volume or 100) end}},
    timeout = table.timeout or 1,
    start_callback = function()
      popup.visible = true
    end,
    stop_callback = function()
      popup.visible = false
    end
  }
end
