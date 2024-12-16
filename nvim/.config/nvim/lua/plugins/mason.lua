local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "RubixDev/mason-update-all",
    },
    keys = {
        { "<leader>M", "<cmd>Mason<cr>", desc = "[M]ason LSP Manager" },
    },
}

function M.config()
    require("mason").setup()
    require('mason-update-all').setup()
end

return M
