local M = {
    "williamboman/mason.nvim",
    dependencies = {
	"williamboman/mason-lspconfig.nvim",
	"harrisoncramer/mason-nvim-dap.nvim",
    },
}

function M.config()
    require("mason").setup()
    require("mason-nvim-dap").setup({
	automatic_setup = true,
    })
    require 'mason-nvim-dap'.setup_handlers()
end

return M
