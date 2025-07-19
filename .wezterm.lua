local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.enable_wayland = true

config.color_scheme = "zenbones_dark"

config.font_size = 12
config.font = wezterm.font_with_fallback({ "Berkeley Mono Nerd Font Mono", "LMMono12-Regular", "Noto Sans Math" })
return config
