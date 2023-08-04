local options = {
    position = "bottom",
    height = 14,
    icons = false,
    mode = "workspace_diagnostics",
    severity = nil,
    group = true,
    padding = true,
    cycle_results = false,
    multiline = false,
    indent_lines = false,
    auto_open = false,
    auto_close = false,
    auto_preview = false,
    auto_jump = {},
    use_diagnostic_signs = true,

    action_keys = {
        close = "q",
        cancel = { "<c-e>", "<esc>" },
        refresh = "r",
        jump = { "<cr>" },
        open_split = { "<c-v>" },
        open_vsplit = { "<c-b>" },
        open_tab = {},
        jump_close = { "o" },
        toggle_mode = { "m", "<tab>" },
        switch_severity = "s",
        toggle_preview = "<c-p>",
        hover = "K",
        preview = { "i", "p" },
        open_code_href = "u",
        close_folds = { "<c-h>", "<c-left>" },
        open_folds = { "<c-l>", "<c-right>" },
        toggle_fold = {},
        previous = "k",
        next = "j",
        help = {},
    },
}

local M = {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = options,
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
    ["t"] = { "<cmd>Trouble<cr>", "[T]rouble Diagnostics" },
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)
end

function M.config()
    vim.api.nvim_create_autocmd(
        { "BufReadPost" },
        {
            group = vim.api.nvim_create_augroup("quick-edit", { clear = true }),
            pattern = "quickfix",
            callback = function()
                vim.api.nvim_create_autocmd(
                    { "BufModifiedSet" },
                    {
                        group = vim.api.nvim_create_augroup("quick-edit-modified", { clear = true }),
                        pattern = "<buffer>",
                        callback = function()
                            require("trouble").refresh()
                        end
                    }
                )
            end
        }
    )
end

return M
