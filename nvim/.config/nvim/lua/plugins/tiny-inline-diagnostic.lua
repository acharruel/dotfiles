local M = {
    "rachartier/tiny-inline-diagnostic.nvim",
    keys = {
        { "<leader>d", "<cmd>TinyInlineDiag toggle<cr>", desc = "Toggle Inline [D]iagnostics" },
    },
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "modern",
            tranparent_bg = true,
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
