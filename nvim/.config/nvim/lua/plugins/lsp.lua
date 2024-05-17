local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
        -- Add vscode-like pictograms to lsp
        "onsails/lspkind-nvim",
        -- Useful status updates for LSP
        "j-hui/fidget.nvim",
    }
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    l = {
        name = "[L]SP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code [A]ction" },
        D = { "<cmd>Telescope diagnostics<cr>", "[D]ocument Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "[F]ormat" },
        i = { "<cmd>LspInfo<cr>", "LSP [I]nfo" },
        I = { "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", "LSP [I]nlays Hints" },
        l = { "<cmd>:LspStart<cr>", "Start [L]SP", },
        L = { "<cmd>:LspStop<cr>", "Start [L]SP", },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "[R]ename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document [S]ymbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace [S]ymbols", },
    }
}

function M.init()
    -- lsp main plugin
    require("lspconfig")

    -- lsp helpers
    require("lsp/mason-loader")
    require("lsp/handlers").setup()

    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)
end

function M.config()
    require("fidget").setup()
end

return M
