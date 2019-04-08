local shapemanager = function(c)
  local rad
  if not c.fullscreen and not c.maximized then
    rad = beautiful.border_radius
  else
    rad = 0
  end
  c.shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, rad)
  end
end

client.connect_signal("manage", function(c)
  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    awful.placement.no_offscreen(c)
  end
  shapemanager(c)
end)

client.connect_signal("property::maximized", function(c)
  shapemanager(c)
end)

client.connect_signal("request::titlebars", function(c)
    local buttons = gears.table.join(
      awful.button({},1,function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.move(c)
      end),
      awful.button({},3,function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.resize(c)
      end)
    )
    local title_left = {
      awful.titlebar.widget.closebutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.minimizebutton(c),
      layout = wibox.layout.fixed.horizontal
    }
    local title_center = {
      {
        {
          align = "center",
          widget = awful.titlebar.widget.titlewidget(c)
        },
        right = 70,
        widget = wibox.container.margin
      },
      buttons = buttons,
      layout = wibox.layout.flex.horizontal
    }
    awful.titlebar(c, {size = beautiful.titlebar_height}):setup {
      {
        title_left,
        title_center,
        layout = wibox.layout.align.horizontal
      },
      left = 20,
      right = 20,
      top = 5,
      bottom = 5,
      layout = wibox.container.margin
    }
end)
