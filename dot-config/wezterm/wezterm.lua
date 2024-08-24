local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
config.font_size = 16.0
config.color_scheme = "Catppuccin Frappe"

return config
