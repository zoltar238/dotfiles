---- MONITORS ----
require("monitors")

---- WORKSPACES ----
require("workspaces")

---- INPUT ----
require("input")

---- MY PROGRAMS ----
local programs = require("programs")

---- KEYBINDINGS ----
require("bindings")

---- ENV ----
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

---- AUTOSTART ----
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("mako")
	-- Delete pacamn cache keeping latest3 versions
	hl.exec_cmd("sudo paccache -rk1")
	-- Launch my most used apps
	hl.exec_cmd(programs.fileManager, { workspace = "8", no_initial_focus = true, monitor = "DP-2" })
	hl.exec_cmd(programs.terminal, { workspace = "1", no_initial_focus = true, monitor = "DP-1" })
	hl.exec_cmd(programs.browser, { workspace = "6", no_initial_focus = true, monitor = "DP-2" })
	hl.exec_cmd(programs.whatsapp, { workspace = "9", no_initial_focus = true, monitor = "DP-2" })
	hl.exec_cmd(programs.flameshot, { workspace = "9", no_initial_focus = true, monitor = "DP-2" })
	hl.exec_cmd(programs.discord, { workspace = "9", no_initial_focus = true, monitor = "DP-2" })
	-- Wait for internet connection before opening spotify to avoid errors
	hl.exec_cmd(
		"sh -c 'until ping -c 1 -W 1 1.1.1.1 >/dev/null 2>&1; do sleep 1; done; exec " .. programs.spotify .. "'",
		{ workspace = "10", no_initial_focus = true, monitor = "DP-2" }
	)
end)

hl.window_rule({
	name = "spotify",
	match = {
		class = "Spotify",
	},
	workspace = "10",
	no_initial_focus = true,
	no_follow_mouse = true,
})

hl.window_rule({
	name = "discord-rule",
	match = {
		--initial_class = "^discord$",
		initial_class = "^vesktop$",
	},
	workspace = "9",
	no_initial_focus = true,
})

hl.window_rule({
	name = "discord",
	match = {
		class = "elecwhat",
	},
	workspace = "9",
	no_initial_focus = true,
})

---- LOOK AND FEEL ----
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 3,
		col = {
			active_border = { colors = { "rgba(91338766)", "rgba(4f007499)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = true,
		allow_tearing = true,
		layout = "master",
	},
	decoration = {
		rounding = 15,
		rounding_power = 3,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 19,
			render_power = 3,
			color = "rgba(0,0,0, 0.3)",
		},
		blur = {
			enabled = true,
			size = 4,
			passes = 1,
			vibrancy = 0.1696,
		},
		glow = {
			enabled = true,
			color = "rgba(91338766)",
			render_power = 4,
			range = 15,
		},
	},
	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
