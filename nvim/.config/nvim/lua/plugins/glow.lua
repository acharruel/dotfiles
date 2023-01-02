local M = {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
}

function M.config()
    vim.g.glow_border = "rounded"
    vim.g.glow_use_pager = false
end

return M
