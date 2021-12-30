local status, which_key = pcall(require, "which-key")
if not status then
    return
end

local setup = {
    plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
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
    ["b"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers",
    },
    ["f"] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
    },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    ["g"] = { "<cmd>Telescope grep_string<cr>", "Grep String" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["n"] = { "<cmd>NnnPicker<CR>", "nnn Picker" },
    ["N"] = { "<cmd>NnnExplorer<CR>", "nnn Explorer" },
    ["w"] = { "<cmd>StripWhitespace<cr>", "Strip White Spaces" },

    G = {
        name = "Git",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Diff",
        },
    },

    i = {
        name = "Indentation",
        s = { "<cmd>setlocal tw=100 ts=4 sw=4 et colorcolumn=100 list<CR>", "Shell style" },
        g = { "<cmd>setlocal tw=100 ts=2 sw=2 et colorcolumn=100 list<CR>", "Glib style" },
    },

    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>ToggleDiag<cr>", "Toggle diagnostics" },
        D = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "LSP Info" },
        I = { "<cmd>LspInstallInfo<cr>", "LSP Installer Info" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
    },

    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope tags<cr>", "Tags" },
    },

    t = {
        name = "Tabs",
        n = { "<cmd>tabnew<cr>", "New tab" },
    },

    z = {
        name = "FZF",
        C = { "<cmd>Commits<CR>", "Commits" },
        F = { "<cmd>Files<CR>", "Files" },
        T = { "<cmd>Tags<CR>", "Tags" },
        c = { "<cmd>BCommits<CR>", "Buffer commits" },
        g = { "<cmd>GFiles<CR>", "Git" },
        t = { "<cmd>BTags<CR>", "Buffer tags" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
