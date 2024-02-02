-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action 
local theme = require 'mccantuta/theme'
local font = require 'mccantuta/font'
local tabs = require 'mccantuta/tabs'
local window = require 'mccantuta/window'
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
window.apply_window_format(config)

-- and finally, return the configuration to wezterm
return config
