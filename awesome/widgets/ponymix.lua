local awful = require("awful")
local self = {}
self.widget = awful.widget.watch("ponymix get-volume", 5,
  function(widget, stdout)
    local vol = string.gsub(stdout, "\n", "")
    widget:set_text(" " .. vol .. "%")
  end
)
self.update = function()
  awful.spawn.easy_async("ponymix get-volume", function(out)
    local vol = string.gsub(out, "\n", "")
    self.widget:set_text(" " .. vol .. "%")      
  end)
end

return self