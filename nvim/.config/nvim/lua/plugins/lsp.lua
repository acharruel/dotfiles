local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Add vscode-like pictograms to lsp
        "onsails/lspkind-nvim",
        -- Useful status updates for LSP
        "j-hui/fidget.nvim",
    },
    keys = {
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code [A]ction" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "[F]ormat Code" },
        { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP [I]nfos" },
        {
            "<leader>lI",
            "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
            desc = "LSP [I]nlays Hints",
        },
        { "<leader>ll", "<cmd>LspStart<cr>", desc = "LSP [S]tart" },
        { "<leader>lL", "<cmd>LspStop<cr>", desc = "LSP [S]top" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "[R]ename" },
    }
}

function M.init()
    -- lsp main plugin
    require("lspconfig")

    -- lsp helpers
    require("lsp/mason-loader")
    require("lsp/handlers").setup()

    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.add({ "<leader>l", group = "[L]SP" })
end

function M.config()
    require("fidget").setup()
end

return M
