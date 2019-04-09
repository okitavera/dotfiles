local awful = require("awful")
local beautiful = require("beautiful")

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
    placement = awful.placement.no_overlap + awful.placement.no_offscreen
  }
}

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

local term = {
  rule = {
    class = "URxvt"
  },
  properties = {size_hints_honor = false}
}

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

local dialog = {
  rule = {
    type = "dialog"
  },
  properties = {
    floating = true,
    placement = awful.placement.centered,
  }
}

return { fallback, floating, nocsd, term, media, dialog }
