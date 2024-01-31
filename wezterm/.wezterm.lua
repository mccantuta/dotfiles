-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action 
local theme = require 'mccantuta/theme'
local font = require 'mccantuta/font'
local tabs = require 'mccantuta/tabs'
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

theme.apply_theme(config) 
font.apply_font(config, wezterm)
tabs.apply_config(config, wezterm, act)

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_frame = {
  border_left_width = 0,
  border_right_width = 0,
  border_bottom_height = 0,
  border_top_height = 0,
  border_left_color = 'purple',
  border_right_color = 'purple',
  border_bottom_color = 'purple',
  border_top_color = 'purple',
}

-- and finally, return the configuration to wezterm
return config
