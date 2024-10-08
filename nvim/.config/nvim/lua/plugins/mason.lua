local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "harrisoncramer/mason-nvim-dap.nvim",
        "RubixDev/mason-update-all",
    },
    keys = {
        { "<leader>M", "<cmd>Mason<cr>", desc = "[M]ason LSP Manager" },
    },
}

function M.config()
    local dap = require('dap')

    require("mason").setup()
    require("mason-nvim-dap").setup({
	automatic_setup = true,
    })
    require 'mason-nvim-dap'.setup_handlers({
	python = function(source_name)
	    dap.adapters.python = {
		type = 'executable';
		command = 'debugpy-adapter';
	    }
	    dap.configurations.python = {
		{
		    type = "python",
		    request = "launch",
		    name = "Launch file",
		    program = "${file}",
		    args = function ()
		    	return { vim.fn.input("Arguments: ", os.getenv("HOME") .. "/", "file") }
		    end,
		},
	    }
	end,
    })
    require('mason-update-all').setup()
end

return M
