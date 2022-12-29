local M = {
    "vimwiki/vimwiki",
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
    W = {
        name = "Vimwiki",
        g = { "<cmd>lua launch_browser()<cr>", "Run Google Chrome" },
        p = { "<cmd>lua require('auto-pandoc').run_pandoc()<cr>", "Run Pandoc" },
        w = { "<cmd>VimwikiIndex<cr>", "Vimwiki Index" },
    },
}

vim.g.vimwiki_list = {
    {
        path = "~/Documents/vimwiki",
        syntax = "markdown",
        ext = ".md",
    }
}
vim.g.vimwiki_global_ext = 0

function M.config()
    local wk = require("which-key")
    wk.register(mappings, opts)
end

return M
