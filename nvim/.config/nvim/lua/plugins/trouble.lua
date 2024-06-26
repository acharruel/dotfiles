local M = {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    keys = {
        {
            "<leader>td",
            "<cmd>Trouble diagnostics toggle focus=false<cr>",
            desc = "[T]rouble [D]iagnostics"
        },
        {
            "<leader>ts",
            "<cmd>Trouble symbols toggle pinned=true results.win.relative=win resuls.win.position=right<cr>",
            desc = "[T]rouble [S]ymbols"
        },
    }
}

function M.init()
    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.register({ t = { name = "[T]rouble" } },
        { prefix = "<leader>" })
end

return M
