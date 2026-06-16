local wezterm = require("wezterm")

local cfg = wezterm.config_builder()

-- Theme config
cfg.font_size = 12
cfg.color_scheme = "Calamity"
cfg.window_background_opacity = 0.55

return cfg
