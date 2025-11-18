local M = {
    "j-hui/fidget.nvim",
    version = "*", -- alternatively, pin this to a specific version, e.g., "1.6.1"
    opts = {
        -- Options related to notification subsystem
        notification = {
            override_vim_notify = true, -- Automatically override vim.notify() with Fidget

            -- Options related to how notifications are rendered as text
            view = {
                stack_upwards = true,   -- Display notification items from bottom to top
                align = "message",       -- Indent messages longer than a single line
                reflow = false,          -- Reflow (wrap) messages wider than notification window
                icon_separator = " ",    -- Separator between group name and icon
                group_separator = "---", -- Separator between notification groups
                group_separator_hl =     -- Highlight group used for group separator
                "Comment",
                line_margin = 1,         -- Spaces to pad both sides of each non-empty line
                render_message =         -- How to render notification messages
                    function(msg, cnt)
                        return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
                    end,
            },

            -- Options related to the notification window and buffer
            window = {
                normal_hl = "Comment", -- Base highlight group in the notification window
                winblend = 90, -- Background color opacity in the notification window
                border = "none", -- Border around the notification window
                zindex = 45, -- Stacking priority of the notification window
                max_width = 0, -- Maximum width of the notification window
                max_height = 0, -- Maximum height of the notification window
                x_padding = 1, -- Padding from right edge of window boundary
                y_padding = 0, -- Padding from bottom edge of window boundary
                align = "bottom", -- How to align the notification window
                relative = "editor", -- What the notification window position is relative to
                tabstop = 4, -- Width of each tab character in the notification window
                avoid = {}   -- Filetypes the notification window should avoid
                -- e.g., { "aerial", "NvimTree", "neotest-summary" }
            },
        },
    },
}

return M
