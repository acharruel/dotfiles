local M = {
    "akinsho/toggleterm.nvim",
    version = 'v2.*',
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
        T = {
            name = "Toggle [T]erm",
            g = { "<cmd>lua LazygitToggle()<cr>", "Toggle lazy[g]it" },
            t = { "<cmd>ToggleTerm<cr>", "Toggle [T]erminal" },
        },
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)
end

function M.config()
    require("toggleterm").setup {
        hide_numbers = true,
        shade_terminals = false,
        float_opts = {
            border = "double",
        },
    }
    local terminal = require("toggleterm.terminal").Terminal
    local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

    function LazygitToggle()
        lazygit:toggle()
    end
end

return M
