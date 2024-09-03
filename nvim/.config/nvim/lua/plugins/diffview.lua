local M = {
    "sindrets/diffview.nvim",
    keys = {
        { "<leader>dd", "<cmd>DiffviewOpen<cr>", desc = "[D]iffview Open" },
        { "<leader>dD", "<cmd>DiffviewClose<cr>", desc = "[D]iffview Close" },
        { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "[D]iffview Current File [H]istory" },
        { "<leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "[D]iffview Repository [H]istory" },
    },
}

function M.init()
    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.add({ "<leader>d", name = "[D]iffview" })
end

return M
