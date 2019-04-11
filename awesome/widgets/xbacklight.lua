local awful = require("awful")
local self = {}

self.cmd = "xbacklight -get"
self.widget = awful.widget.watch(self.cmd, 60,
  function(widget, out)
    local bright = string.gsub(out, "\n", "")
    widget:set_text(" "..bright .. "%")
  end
)
self.update = function()
  awful.spawn.easy_async(self.cmd, function(out)
    local bright = string.gsub(out, "\n", "")
    self.widget:set_text(" "..bright .. "%")
  end)
end

return self
