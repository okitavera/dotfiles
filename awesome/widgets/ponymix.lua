local awful = require("awful")
local ponymix = {}
ponymix.widget = awful.widget.watch("ponymix get-volume", 5,
  function(widget, stdout)
    local vol = string.gsub(stdout, "\n", "")
    widget:set_text(" " .. vol .. "%")
  end
)
ponymix.update = function()
  awful.spawn.easy_async("ponymix get-volume", function(out)
    local vol = string.gsub(out, "\n", "")
    ponymix.widget:set_text(" " .. vol .. "%")      
  end)
end

return ponymix