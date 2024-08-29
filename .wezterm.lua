-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

-- Font configure
config.font = wezterm.font("JetBrainsMono Nerd Font", {weight = "Bold"})
config.font_size = 10

-- Hide bar tab
config.enable_tab_bar = false
config.window_decorations = "TITLE"

-- True color


-- and finally, return the configuration to wezterm
return config
