local M = {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
    }
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
    d = {
        name = "[D]ebugger",
        b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle [B]reakpoint" },
        B = { ":Telescope dap list_breakpoints", "List [B]reakpoints" },
        q = { function()
            require("dapui").close()
            require("dap").terminate()
        end, "[Q]uit DAP UI" },
        r = { "<cmd>lua require('dap').restart()<cr>", "[R]estart Session" },
    },
}

function M.init()
    vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<cr>")
    vim.keymap.set("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>")
    vim.keymap.set("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>")
    vim.keymap.set("n", "<F12>", "<cmd>lua require('dap').step_out()<cr>")

    -- register which-key mappings
    local wk = require("which-key")
    wk.register(mappings, opts)

    vim.fn.sign_define('DapBreakpoint', { text = '⏺', texthl = '', linehl = '', numhl = '' })
end

function M.config()
    local dap = require("dap")
    local dapui = require("dapui")

    require("nvim-dap-virtual-text").setup()
    dapui.setup({
        layouts = {
            {
                elements = {
                    -- Elements can be strings or table with id and size keys.
                    "scopes",
                    "breakpoints",
                    "stacks",
                    "watches",
                },
                size = 0.4, -- 50 columns
                position = "left",
            },
            {
                elements = {
                    "repl",
                    "console",
                },
                size = 0.25, -- 25% of total lines
                position = "bottom",
            },
        },
        controls = {
            -- Requires Neovim nightly (or 0.8 when released)
            enabled = true,
            -- Display controls in this element
            element = "repl",
            icons = {
                pause = "⏯",
                play = "⏯",
                step_into = "⮧",
                step_over = "⮣",
                step_out = "⮥",
                step_back = "⮌",
                run_last = "↪",
                terminate = "⏹",
            },
        },
        icons = { expanded = "⏷", collapsed = "▸", current_frame = "▸" },
        floating = {
            max_height = nil,
            max_width = nil,
            border = "rounded",
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
end

return M
