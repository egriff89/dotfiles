-- ~/.config/wezterm/wezterm.lua
-- Author: Eric Griffith
-- http://www.gitlab.com/egriff89

local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'DoomOne'
config.window_background_opacity = 0.90
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 09.0

config.keys = {
    {
        key = "t",
        mods = "SHIFT|ALT",
        action = act.SpawnTab "CurrentPaneDomain",
    },
    {
        key = "w",
        mods = "SHIFT|ALT",
        action = wezterm.action.CloseCurrentTab { confirm = true },
    }
}

return config
