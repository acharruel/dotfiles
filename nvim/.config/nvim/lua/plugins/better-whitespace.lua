local M = {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    keys = {
        { "<leader>w", "<cmd>StripWhitespace<cr>", desc = "Strip [W]hite Spaces" },
    },
}

function M.config()
    vim.g.better_whitespace_enabled = 1
    vim.g.better_whitespace_operator = ""
    vim.g.better_whitespace_guicolor = "#bf616a"
end

return M
