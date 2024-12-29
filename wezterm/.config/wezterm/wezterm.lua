-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- colorscheme
config.color_scheme = 'Nord (Gogh)'

-- font
config.font = wezterm.font('Hack Nerd Font',
    {
        -- weight = 'Bold',
        -- italic = true,
    }
)

-- don't always show tab bar
config.hide_tab_bar_if_only_one_tab = true

-- padding
config.window_padding = {
    left = 1,
    right = 1,
    top = 0,
    bottom = 0,
}

-- scrollback buffer
config.scrollback_lines = 10000

-- hide mouse
config.hide_mouse_cursor_when_typing = true

-- window apha channel opacity
config.window_background_opacity = 0.95

return config
