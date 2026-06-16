-- Pull in the wezterm API
local wezterm = require("wezterm")
local mytable = require("lib/mystdlib").mytable

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

config.max_fps = 144

local full_config = mytable.merge_all(require("theme"), config, {})

-- Finally, return the configuration to wezterm:
return full_config
