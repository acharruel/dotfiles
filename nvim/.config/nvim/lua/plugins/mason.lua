local M = {
    "williamboman/mason.nvim",
    dependencies = {
	"williamboman/mason-lspconfig.nvim",
    },
}

function M.config()
    require("mason").setup()
end

return M
