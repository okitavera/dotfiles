local awful = require("awful")
local self = {}

local function get_percentage(out)
  for k, v in string.gmatch(out, '([%a]+[%a|-]+):%s*([%a|%d]+[,|%a|%d]-)') do
    if k == "percentage" then
      return tonumber(v)
    end
  end
end

self.cmd = "upower -i /org/freedesktop/UPower/devices/battery_BAT0"
self.widget = awful.widget.watch(self.cmd, 30,
  function(widget, out)
    widget:set_text(" " .. get_percentage(out) .. "%")
  end
)
self.update = function()
  awful.spawn.easy_async(self.cmd, function(out)
    self.widget:set_text(" " .. get_percentage(out) .. "%")
  end)
end

return self
