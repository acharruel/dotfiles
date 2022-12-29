local M = {
    "ntpeters/vim-better-whitespace",
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
    ["w"] = { "<cmd>StripWhitespace<cr>", "Strip [W]hite Spaces" },
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)
end

function M.config()
    vim.g.better_whitespace_enabled = 1
    vim.g.better_whitespace_operator = ""
    vim.g.better_whitespace_guicolor = "#bf616a"
end

return M
