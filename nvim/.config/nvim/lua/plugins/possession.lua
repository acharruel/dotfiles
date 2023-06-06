local M = {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    S = {
        name = "[S]essions",
        l = {
            function()
                require("nvim-possession").list()
            end,
            "[L]ist",
        },
        n = {
            function()
                require("nvim-possession").new()
            end,
            "[N]ew",
        },
        u = {
            function()
                require("nvim-possession").update()
            end,
            "[U]pdate",
        },
        d = {
            function()
                require("nvim-possession").delete()
            end,
            "[D]elete",
        },
    },
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)
end

function M.config()
    require("nvim-possession").setup()
end

return M
