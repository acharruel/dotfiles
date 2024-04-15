local M = {
    "folke/trouble.nvim",
    branch = "dev", -- IMPORTANT!
    cmd = "Trouble",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
}

local key_opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    t = {
        ["d"] = { "<cmd>Trouble diagnostics toggle<cr>", "[T]rouble [D]iagnostics" },
        ["s"] = { "<cmd>Trouble lsp_documents_symbols toggle<cr>", "[T]rouble [S]ymbols" },
    },
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, key_opts)
end

return M
