local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "RubixDev/mason-update-all",
    },
    keys = {
        { "<leader>M", "<cmd>Mason<cr>", desc = "[M]ason LSP Manager" },
    },
}

function M.config()
    require("mason").setup({
        ui = {
            border = "rounded",
        },
    })
    require('mason-update-all').setup()
end

return M
