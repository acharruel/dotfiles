local M = {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "modern",
            options = {
                multilines = {
                    enabled = true,
                },
            }
        })
        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
        vim.diagnostic.open_float = require("tiny-inline-diagnostic.override").open_float
    end,
}

return M
