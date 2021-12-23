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
map('n', '<C-F>', "<cmd>lua require('telescope.builtin').grep_string()<CR>")
map('n', '<C-G>', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>")

-- vim pickers
map('n', '<C-H>', "<cmd>lua require('telescope.builtin').help_tags()<CR>")
map('n', '<C-O>', "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
map('n', '<C-S>', "<cmd>lua require('telescope.builtin').search_history()<CR>")
map('n', '<C-Y>', "<cmd>lua require('telescope.builtin').tags()<CR>")

-- lsp pickers
map('n', '<C-D>', "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
map('n', '<C-K>', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
map('n', '<C-R>', "<cmd>lua require('telescope.builtin').lsp_references()<CR>")

-- git pickers
map('n', '<C-C>', "<cmd>lua require('telescope.builtin').git_bcommits()<CR>")
