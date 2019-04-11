local awful = require("awful")
local upower = {}

local get_percentage = function(out)
  for k, v in string.gmatch(out, '([%a]+[%a|-]+):%s*([%a|%d]+[,|%a|%d]-)') do
    if k == "percentage" then
      return tonumber(v)
    end
  end
end

upower.cmd = "upower -i /org/freedesktop/UPower/devices/battery_BAT0"
upower.widget = awful.widget.watch(upower.cmd, 30, function(dout)
    widget:set_text(" " .. get_percentage(out) .. "%")
  end
)
upower.update = function()
  awful.spawn.easy_async(upower.cmd, function(out)
    upower.widget:set_text(" " .. get_percentage(out) .. "%")
  end)
end
return upower