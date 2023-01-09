local M = {
    "/moll/vim-bbye",
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
    q = { "<cmd>Bdelete<cr>", "[B]uffer Delete" },
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)
end

return M
