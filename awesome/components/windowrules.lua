local awful = require("awful")
local bindings = require("components.bindings")
return {
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      keys = bindings.clientkeys,
      buttons = bindings.clientbuttons,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },
  {
    rule_any = {
      instance = {
        "pinentry"
      },
      role = {
        "pop-up"
      }
    },
    properties = {floating = true}
  },
  -- CSD
  {
    rule_any = {
      type = {"normal", "dialog"}
    },
    properties = {
      titlebars_enabled = function(c)
        return not c.requests_no_titlebar
      end
    }
  },
  -- rxvt-unicode size workaround
  {
    rule = {
      class = "URxvt"
    },
    properties = {size_hints_honor = false}
  },
  -- media apps
  {
    rule_any = {
      class = {
        "feh",
        "Viewnior",
        "mpv",
        "Gimp",
        "Inkscape",
      }
    },
    except = {
      type = "dialog"
    },
    properties = {
      floating = true,
      maximized = true
    }
  },
  -- logout ui
  {
    rule = {
      class = "[Cc]learine"
    },
    properties = {
      skip_taskbar = true,
      fullscreen = true,
      above = true,
    }
  },
  -- filechooser and regular dialog
  {
    rule = {
      type = "dialog"
    },
    properties = {
      floating = true,
      placement = awful.placement.centered
    }
  },
}
