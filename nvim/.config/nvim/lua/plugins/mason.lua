local M = {
    "williamboman/mason.nvim",
    dependencies = {
	"williamboman/mason-lspconfig.nvim",
	"harrisoncramer/mason-nvim-dap.nvim",
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
end

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["M"] = { "<cmd>Mason<CR>", "[M]ason LSP Manager" },
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)
end

return M
