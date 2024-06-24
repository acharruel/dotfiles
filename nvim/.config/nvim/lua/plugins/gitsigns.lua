local M = {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
        G = {
            name = "[G]it",
            b = { "<cmd>Telescope git_branches<cr>", "Checkout [B]ranch" },
            c = { "<cmd>Telescope git_commits<cr>", "Checkout [C]ommit" },
            d = { "<cmd>Gitsigns diffthis HEAD<cr>", "[D]iff" },
            l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "B[l]ame" },
            p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "[P]review Hunk" },
            r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "[R]eset Hunk" },
            R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "[R]eset Buffer" },
            s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "[S]tage Hunk" },
            S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "[S]tage Buffer" },
            u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "[U]ndo Stage Hunk" },
            o = { "<cmd>Telescope git_status<cr>", "[O]pen changed file" },
        }
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)

    -- gitsigns mappings
    vim.keymap.set("n", "[g", "<cmd>lua require 'gitsigns'.next_hunk()<cr>")
    vim.keymap.set("n", "]g", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>")
end

function M.config()
    require("gitsigns").setup({
        signs = {
            add = { text = "┃" },
            change = { text = "┃" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1
        },
    })
end

return M
