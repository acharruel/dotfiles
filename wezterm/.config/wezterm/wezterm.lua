-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Nord (Gogh)'

config.font = wezterm.font 'Hack Nerd Font'

config.enable_tab_bar = false

config.window_padding = {
    left = 1,
    right = 1,
    top = 0,
    bottom = 0,
}


-- and finally, return the configuration to wezterm
return config
