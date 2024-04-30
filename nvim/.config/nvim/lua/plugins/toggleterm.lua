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
            g = { "<cmd>lua GituiToggle()<cr>", "Toggle [g]itui" },
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
    local gitui = terminal:new({ cmd = "gitui", hidden = true, direction = "float" })

    function GituiToggle()
        gitui:toggle()
    end
end

return M
