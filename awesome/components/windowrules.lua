local awful = require("awful")
local beautiful = require("beautiful")
local bindings = require("components.bindings")

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

local max_normal = {
  rule = {
    type = "normal"
  },
  properties = {
    maximized = function(c)
      local avail = c.screen.geometry.height - beautiful.titlebar_height
      if (c.height >= avail) or (c.width >= c.screen.geometry.width) then
        return true
      else
        return false
      end
    end
  }
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

return { fallback, max_normal, floating, nocsd, term, media, dialog }
