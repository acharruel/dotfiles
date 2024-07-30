local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    dependencies = {
        "echasnovski/mini.icons",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        preset = "classic",
        delay = function(ctx)
            return ctx.plugin and 0 or 200
        end,
        notify = true,
        win = {
            -- don't allow the popup to overlap with the cursor
            no_overlap = true,
            width = 1,
            height = { min = 4, max = 25 },
            -- col = 0,
            -- row = math.huge,
            border = "rounded",
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            title = true,
            title_pos = "center",
            zindex = 1000,
        },
        layout = {
            width = { min = 20 }, -- min and max width of the columns
            spacing = 3,      -- spacing between columns
        },
        keys = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>", -- binding to scroll up inside the popup
        },
        show_help = true,      -- show a help message in the command line for using WhichKey
        show_keys = true,      -- show the currently pressed key and its label as a message in the command line
        debug = false,         -- enable wk.log in the current directory
    }
}

local mappings = {
    {
        "<leader>/",
        function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
                layout_config = { width = 0.7, height = 0.8 },
            })
        end,
        desc = "Word Search",
        nowait = true,
        remap = false,
    },
    {
        "<leader>a",
        "<cmd>:b#<cr>",
        desc = "[A]lternate File Switch",
        nowait = true,
        remap = false,
    },
    {
        "<leader>c",
        "<cmd>set cursorline!<cr>",
        desc = "Toggle [C]ursorline",
        nowait = true,
        remap = false,
    },
    {
        "<leader>C",
        "<cmd>lua require('togglecolumn').toggle_colorcolumn()<cr>",
        desc = "Toggle [C]olorcolumn",
        nowait = true,
        remap = false,
    },
    {
        "<leader>x",
        "<cmd>source %<cr>",
        desc = "Source current file",
        nowait = true,
        remap = false,
    },

    { "<leader>i", group = "Indentation", nowait = true, remap = false },
    {
        "<leader>ig",
        "<cmd>setlocal tw=100 ts=2 sw=2 et colorcolumn=100 list<CR>",
        desc = "Glib style",
        nowait = true,
        remap = false,
    },
    {
        "<leader>is",
        "<cmd>setlocal tw=100 ts=4 sw=4 et colorcolumn=100 list<CR>",
        desc = "Shell style",
        nowait = true,
        remap = false,
    },
    {
        "<leader>it",
        "<cmd>setlocal tw=100 ts=8 sw=8 et colorcolumn=80 list<CR>",
        desc = "Tag Heuer style",
        nowait = true,
        remap = false,
    },
}

function M.config()
    local status, wk = pcall(require, "which-key")
    if not status then
        return
    end

    -- wk.setup(setup)
    wk.add(mappings)
end

return M
