local wezterm = require("wezterm")
local act = wezterm.action

return {
	keys = {
		-- New tab
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = act.SpawnTab("CurrentPaneDomain"),
		},

		-- Move to preb tab
		{
			key = "h",
			mods = "CTRL",
			action = act.ActivateTabRelative(-1),
		},

		-- Move to newxt tab
		{
			key = "l",
			mods = "CTRL",
			action = act.ActivateTabRelative(1),
		},

		-- Close current tab
		{
			key = "d",
			mods = "CTRL|SHIFT",
			action = act.CloseCurrentTab({ confirm = true }),
		},

		-- Displace tab to the right
		{
			key = "H",
			mods = "CTRL|SHIFT",
			action = act.MoveTabRelative(-1),
		},

		-- Displace tab to the left
		{
			key = "L",
			mods = "CTRL|SHIFT",
			action = act.MoveTabRelative(1),
		},
	},
}
