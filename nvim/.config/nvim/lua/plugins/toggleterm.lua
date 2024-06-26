local M = {
    "akinsho/toggleterm.nvim",
    version = 'v2.*',
    keys = {
        { "<leader>Tg", "<cmd>lua GituiToggle()<cr>", desc = "Toggle [g]itui" },
        { "<leader>Tt", "<cmd>ToggleTerm<cr>", desc = "Toggle [T]erminal" },
    },
}

function M.init()
    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.register({ T = { name = "Toggle [T]erm" } },
        { prefix = "<leader>" })
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
