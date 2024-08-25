-- Wezterm configuration for Nethack/Crawl.

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Color scheme.
local quick_color_scheme = "OneDark (base16)"
config.color_scheme = quick_color_scheme

-- Padding and font

-- Left padding to center game on screen.
-- Depends on monitor size and resolution.
-- Crawl: left = 500
-- Nethack: left = 0
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Maximum map view in Nethack: 80
----------------------------------------------------------------------------80-|
-- Font size; depends on monitor size and resolution.
-- Nethack:
-- config.font_size = 20
-- Crawl:
config.font_size = 26

-- Use the default font (JetBrains Mono);
-- alternatively enable Source Code Pro:
config.font = wezterm.font_with_fallback({
	"SauceCodePro Nerd Font",
	"Source Code Pro",
})

-- TAB bar configuration

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
local scheme = wezterm.get_builtin_color_schemes()[quick_color_scheme]
config.colors = {
	tab_bar = {
		background = scheme.background,
		active_tab = {
			bg_color = scheme.background,
			fg_color = scheme.foreground,
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = scheme.background,
			fg_color = scheme.foreground,
		},
		inactive_tab_hover = {
			italic = true,
			bg_color = scheme.background,
			fg_color = scheme.foreground,
		},

		new_tab = {
			bg_color = scheme.background,
			fg_color = scheme.background,
		},

		new_tab_hover = {
			bg_color = scheme.background,
			fg_color = scheme.foreground,
		},
	},
}

return config
