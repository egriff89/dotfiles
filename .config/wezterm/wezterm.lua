-- ~/.config/wezterm/wezterm.lua
-- Author: Eric Griffith
-- http://www.gitlab.com/egriff89

local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'DoomOne'
config.window_background_opacity = 0.90
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 09.0

return config
