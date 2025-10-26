local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Add vscode-like pictograms to lsp
        "onsails/lspkind-nvim",
        -- Useful status updates for LSP
        "j-hui/fidget.nvim",
        -- bridge between lspconfig and mason
        "williamboman/mason-lspconfig.nvim",
    },
    keys = {
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code [A]ction" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",      desc = "[F]ormat Code" },
        { "<leader>li", "<cmd>LspInfo<cr>",                       desc = "LSP [I]nfos" },
        {
            "<leader>lI",
            "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
            desc = "LSP [I]nlays Hints",
        },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "[R]ename" },
        { "<leader>ld", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "<leader>lD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "<leader>lI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "<leader>ly", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    }
}

local function configure_diagnostics()
    local signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰝥',
            [vim.diagnostic.severity.WARN] = '󰝥',
            [vim.diagnostic.severity.HINT] = '󰝥',
            [vim.diagnostic.severity.INFO] = '󰝥',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = signs,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)
end

local function lsp_specific_config()
    vim.lsp.config['lua_ls'] = {
        -- Specific settings to send to the server. The schema for this is
        -- defined by the server. For example the schema for lua-language-server
        -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
        settings = {
            Lua = {
                -- Tells Lua that a global variable named vim exists to not have warnings when configuring neovim
                diagnostics = {
                    globals = { "vim", "Snacks" },
                },
            }
        }
    }

    vim.lsp.config('systemdls', {
        cmd = { 'systemd-lsp' },
        filetypes = { 'systemd' },
    })
    vim.lsp.enable('systemdls')
end

function M.init()
    -- lsp main plugin
    require("lspconfig")

    -- mason
    local status, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not status then return end
    mason_lspconfig.setup()

    configure_diagnostics()
    lsp_specific_config()

    -- custom on_attach behaviour
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
            local opts = { noremap = true, silent = true }
            local bufnr = args.buf
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "K", '<cmd>lua vim.lsp.buf.hover({border="rounded"})<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua Snacks.picker.lsp_references()<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ float = "true" })<CR>',
                opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ float = "true" })<CR>',
                opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float(0, { scope = "line" })<CR>',
                opts)
        end,
    })

    -- which-key group
    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.add({ "<leader>l", group = "[L]SP", icon = "" })
end

function M.config()
    require("fidget").setup()
end

return M
