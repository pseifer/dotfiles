-- Wezterm configuration for Crawl.

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Custom colour scheme.

-- Based on the default tiles colour theme,
-- (which in turn is partially based on the
--  gnome terminal theme I think).
-- Uses AA and AAA WCAG compliant colours
-- (dark and light, respectively) improving
-- readability slightly. Some light colours
-- are adapted to be more distinct from the
-- brighter dark colours.
-- Also uses a purple-tinted dark grey and
-- more sandy off-white for white, which helps
-- distinquish lighted from non-lighted areas.

config.colors = {
	background = "#000000",
	foreground = "#ffffff",

	cursor_bg = "#ffffff",
	cursor_fg = "#000000",
	cursor_border = "#ffffff",

	ansi = {
		"#000000", -- 0  Black
		"#dc3232", -- 1  Red
		"#4e9a06", -- 2  Green
		"#926f36", -- 3  Yellow
		"#615dff", -- 4  Blue
		"#d333d1", -- 5  Magenta
		"#06989a", -- 6  Cyan
		"#bbb2a1", -- 7  White
	},

	brights = {
		"#605666", -- 8  Bright Black (806f85)
		"#f76c3e", -- 9  Bright Red
		"#8ae234", -- 10 Bright Green
		"#fce94f", -- 11 Bright Yellow
		"#6bacf5", -- 12 Bright Blue
		"#fd71fa", -- 13 Bright Magenta
		"#34e2e2", -- 14 Bright Cyan
		"#eeeeec", -- 15 Bright White
	},
}

-- Left padding to center game on screen.
-- Depends on monitor size and resolution.
config.window_padding = {
	left = 450, -- relevant part
	right = 0,
	top = 0,
	bottom = 0,
}

-- Font size; depends on monitor size and resolution.
config.font_size = 26

-- Use Source Code Pro, if available.
config.font = wezterm.font_with_fallback({
	"SauceCodePro Nerd Font",
	"Source Code Pro",
})

-- TAB bar configuration

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Other settings.

-- Hides the mouse,	most of the time.
config.hide_mouse_cursor_when_typing = true

-- Launch in full screen with DCSS.

wezterm.on("gui-startup", function(_)
	local _, _, window = wezterm.mux.spawn_window({})
	window:gui_window():toggle_fullscreen()
end)

config.default_prog = { "launchwezgames" }

-- done.

return config
