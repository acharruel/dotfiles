local M = {
    "lewis6991/gitsigns.nvim",
    keys = {
        { "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "[B]lame" },
        { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Current [L]ine blame" },
        { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "[P]review Hunk" },
        { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "[R]eset Hunk" },
        { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "[R]eset Buffer" },
        { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "[S]tage Hunk" },
        { "<leader>gS", "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", desc = "[S]tage Buffer" },
        { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "[U]ndo Stage Hunk" },

        { "[g", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
        { "]g", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Previous Hunk" },
    },
}

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
