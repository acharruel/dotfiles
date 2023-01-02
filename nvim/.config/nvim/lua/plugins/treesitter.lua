local M = {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/playground",
    },
}

function M.build()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
end

function M.config()
    local status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not status then
        return
    end

    treesitter_configs.setup {
        ensure_installed = 'all',
        highlight = {
            enable = true
        },
        indent = {
            enable = true,
            disable = { 'python' }
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                scope_incremental = "<Tab>",
                node_decremental = "<S-Tab>",
            },
        },
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                },
            },
        },
    }

    local status, treesitter_context = pcall(require, "treesitter-context")
    if not status then
        print("error!")
        return
    end

    treesitter_context.setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            default = {
                'class',
                'function',
                'method',
                -- 'for', -- These won't appear in the context
                -- 'while',
                -- 'if',
                -- 'switch',
                -- 'case',
            },
        },

        zindex = 20, -- The Z-index of the context window
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    }
end

return M
