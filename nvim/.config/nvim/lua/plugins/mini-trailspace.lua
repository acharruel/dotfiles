local M = {
    'nvim-mini/mini.trailspace',
    version = '*',
    keys = {
        { "<leader>ww", "<cmd>lua require('mini.trailspace').trim()<cr>",            desc = "Trim [W]hite Spaces" },
        { "<leader>wl", "<cmd>lua require('mini.trailspace').trim_last_lines()<cr>", desc = "Trim Last Blank [L]ines" },
    },
}

function M.config()
    require('mini.trailspace').setup({
        only_in_normal_buffers = true,
    })
end

function M.init()
    require('mini.trailspace').highlight()

    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.add({ "<leader>w", group = "Trailing [W]hitespace" })
end

return M
