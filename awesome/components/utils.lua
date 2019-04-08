local utils = {}

utils.pywal = {}
utils.pywal.cachedir = gears.filesystem.get_xdg_cache_home() .. "/wal/"
utils.pywal.colors = dofile(utils.pywal.cachedir .. "colors.lua")
utils.pywal.wallpaper = utils.pywal.colors.wallpaper
utils.pywal.set_wallpaper = function(screen)
	gears.wallpaper.maximized(utils.pywal.wallpaper, screen, true)
end

utils.dpi = xresources.apply_dpi

return utils
