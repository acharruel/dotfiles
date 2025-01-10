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

-- Keymaps
-- config.disable_default_key_bindings = true
-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'w', mods = 'ALT', timeout_milliseconds = 1000 }
config.keys = {
    -- general functions
    {
        key = 'p',
        mods = 'LEADER',
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = 'n',
        mods = 'LEADER',
        action = wezterm.action.SpawnWindow,
    },
    {
        key = 'U',
        mods = 'LEADER',
        action = wezterm.action.CharSelect,
    },
    {
        key = 'U',
        mods = 'LEADER',
        action = wezterm.action.CharSelect,
    },

    -- panes management
    {
        key = '|',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'LeftArrow',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'f',
        mods = 'LEADER',
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = 'PageUp',
        mods = 'SHIFT',
        action = wezterm.action.ScrollByPage(-1),
    },
    {
        key = 'PageDown',
        mods = 'SHIFT',
        action = wezterm.action.ScrollByPage(1),
    },

    -- tabs management
    {
        key = 't',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'DefaultDomain',
    },
}

wezterm.on('update-right-status', function(window, pane)
    local leader = ''
    if window:leader_is_active() then
        leader = 'LEADER'
    end
    window:set_right_status(leader)
end)

return config
