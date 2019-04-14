local awful = require("awful")
local beautiful = require("beautiful")
local bindings = require("components.bindings")

local self = {}

local fallback = {
  rule = {},
  properties = {
    border_width = beautiful.border_width,
    border_color = beautiful.border_normal,
    focus = awful.client.focus.filter,
    raise = true,
    keys = bindings.clientkeys,
    buttons = bindings.clientbuttons,
    screen = awful.screen.preferred,
    placement = awful.placement.no_offscreen + awful.placement.no_overlap
  }
}
table.insert(self, fallback)

local floating = 	{
  rule_any = {
    instance = {
      "pinentry"
    },
    role = {
      "pop-up"
    }
  },
  properties = {floating = true}
}
table.insert(self, floating)

local max_normal = {
  rule = {
    type = "normal"
  },
  properties = {
    maximized_vertical = function(c)
      return c.height >= (c.screen.geometry.height - beautiful.wibar_height)
    end
  }
}
table.insert(self, max_normal)

local nocsd =	{
  rule_any = {
    type = {"normal", "dialog"}
  },
  properties = {
    titlebars_enabled = function(c)
      return not c.requests_no_titlebar
    end
  }
}
table.insert(self, nocsd)

local term = {
  rule = {
    class = "URxvt"
  },
  properties = {size_hints_honor = false}
}
table.insert(self, term)

local media = {
  rule_any = {
    class = {
      "feh",
      "Viewnior",
      "mpv",
      "Gimp",
      "Inkscape",
    }
  },
  properties = {
    floating = true,
    maximized = true
  }
}
table.insert(self, media)

local dialog = {
  rule = {
    type = "dialog"
  },
  properties = {
    floating = true,
    placement = awful.placement.centered,
  }
}
table.insert(self, dialog)

return self
