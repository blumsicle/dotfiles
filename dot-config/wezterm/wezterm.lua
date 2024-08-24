local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
config.font_size = 16.0
config.color_scheme = "Catppuccin Frappe"

local colors = wezterm.color.get_builtin_schemes()[config.color_scheme]

config.tab_bar_at_bottom = true
-- config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font({ family = "IosevkaTerm Nerd Font Mono", weight = "Bold" }),
	font_size = 12.0,

	active_titlebar_bg = colors.background,
	inactive_titlebar_bg = colors.background,
}

config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = 0,
	bottom = 0,
}

config.colors = {
	tab_bar = {
		background = colors.background,
		inactive_tab = {
			bg_color = colors.background,
			fg_color = colors.foreground,
		},
		new_tab = {
			bg_color = colors.background,
			fg_color = colors.foreground,
		},
		inactive_tab_edge = colors.background,
	},
}

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = config.leader.key,
		mods = "LEADER",
		action = act.SendKey({ key = config.leader.key, mods = config.leader.mods }),
	},

	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},

	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},

	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
