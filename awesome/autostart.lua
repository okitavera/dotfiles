local autostart = {
  early = {
    "xrdb ~/.Xresources",
    "wal -R",
    "pkill compton; compton"
  },
  late = {
    "udiskie",
    "mpd",
    "pkill glava; glava -d"
  }
}

autostart.invoke = function(table)
  for i, cmd in ipairs(table) do
    awful.spawn.with_shell(cmd)
  end
end

return autostart