local telescope = require("telescope")

telescope.setup{
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                                            -- the default case_mode is "smart_case"
        }
    }
}

telescope.load_extension('fzf')

-- file pickers
map('n', '<leader>s', "<cmd>lua require('telescope.builtin').grep_string()<CR>")
map('n', '<leader>g', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files()<CR>")

-- vim pickers
map('n', '<leader>ht', "<cmd>lua require('telescope.builtin').help_tags()<CR>")
map('n', '<leader>of', "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
-- map('n', '<leader>sh', "<cmd>lua require('telescope.builtin').search_history()<CR>")
map('n', '<leader>t', "<cmd>lua require('telescope.builtin').tags()<CR>")

-- lsp pickers
map('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
map('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
map('n', '<leader>ds', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")

-- git pickers
map('n', '<leader>gc', "<cmd>lua require('telescope.builtin').git_bcommits()<CR>")
