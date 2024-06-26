local M = {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    keys = {
        { "<leader>Sl", "<cmd>lua require('nvim-possession').list()<cr>", desc = "[L]ist Sessions" },
        { "<leader>Sn", "<cmd>lua require('nvim-possession').new()<cr>", desc = "[N]ew Session" },
        { "<leader>Su", "<cmd>lua require('nvim-possession').update()<cr>", desc = "[U]pdate Session" },
        { "<leader>Sd", "<cmd>lua require('nvim-possession').delete()<cr>", desc = "[D]elete Session" },
    },
}

function M.init()
    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.register({ S = { name = "[S]essions" } },
        { prefix = "<leader>" })
end

function M.config()
    require("nvim-possession").setup()
end

return M
