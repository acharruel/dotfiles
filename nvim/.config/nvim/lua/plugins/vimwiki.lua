local M = {
    "vimwiki/vimwiki",
    keys = {
        { "<leader>Wg", "<cmd>lua LaunchBrowser()<cr>", desc = "Run [G]oogle Chrome" },
        { "<leader>Wp", "<cmd>lua require('auto-pandoc').run_pandoc()<cr>", desc = "Run [P]andoc" },
        { "<leader>Ww", "<cmd>VimwikiIndex<cr>", desc = "Vim [W]iki Index" },
    }
}

function M.init()
    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.add({ "<leader>W", group = "Vim [W]iki" })

    vim.g.vimwiki_list = {
        {
            path = "~/Documents/vimwiki",
            syntax = "markdown",
            ext = ".md",
        }
    }

    vim.g.vimwiki_global_ext = 0
end

return M
