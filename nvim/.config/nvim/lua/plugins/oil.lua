local M = {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "-", "<cmd>lua require('oil').toggle_float()<cr>", desc = "Open Oil in floating window" },
        { "<leader>-", "<cmd>Oil<cr>", desc = "Open Oil" },
    }
}


function M.config()
    require("oil").setup()
end

return M
