local M = {
    -- powerpoint style presentation
    "sotte/presenting.vim",
    dependencies = {
        "jghauser/auto-pandoc.nvim",
        "nvim-lua/plenary.nvim",
    },
}

function M.config()
    require('auto-pandoc')
end

return M
