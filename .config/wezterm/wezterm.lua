-- ~/.config/wezterm/wezterm.lua
-- Author: Eric Griffith
-- http://www.gitlab.com/egriff89

local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- Appearance settings
config.color_scheme = "TokyoNight-Storm"
config.window_background_opacity = 0.95
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"FiraCode Nerd Font",
})
config.font_size = 09.0

-- Tab bar settings
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false -- Retro appearance

-- Keybinds
config.keys = {
	{
		key = "t",
		mods = "SHIFT|ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "c",
		mods = "SHIFT|ALT",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "[",
		mods = "ALT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "]",
		mods = "ALT",
		action = act.ActivateTabRelative(1),
	},
}

return config
