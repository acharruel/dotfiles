-- Generic mappings
map('n', '<leader>h', '<cmd>noh<CR>')                   -- reset highlighting
map('n', '<leader>w', '<cmd>StripWhitespace<CR>')       -- strip whitespaces
map('n', '<leader><left>', '<cmd>tabprevious<CR>')      -- tab navigation
map('n', '<leader><right>', '<cmd>tabnext<CR>')
map('n', '<leader>nt', '<cmd>tabnew<CR>')

-- Code indentation stuffs
map('n', '<leader>sh', '<cmd>setlocal tw=100 ts=4 sw=4 et colorcolumn=100 list<CR>')    -- shell style
map('n', '<leader>gst', '<cmd>setlocal tw=100 ts=2 sw=2 et colorcolumn=100 list<CR>')   -- glib style

-- EasyAlign
vim.api.nvim_exec('xmap ga <Plug>(EasyAlign)', false)
vim.api.nvim_exec('nmap ga <Plug>(EasyAlign)', false)

-- fzf
map('n', '<leader>ff', '<cmd>GFiles<CR>')
map('n', '<leader>fF', '<cmd>Files<CR>')
map('n', '<leader>ft', '<cmd>BTags<CR>')
map('n', '<leader>fT', '<cmd>Tags<CR>')
map('n', '<leader>fc', '<cmd>BCommits<CR>')
map('n', '<leader>fC', '<cmd>Commits<CR>')

-- packer sync plugins
map('n', '<leader>u', '<cmd>PackerSync<CR>')

-- visual selection yanked to " register
vim.api.nvim_exec('vmap <LeftRelease> "*ygv', false)
vim.api.nvim_exec('vmap <RightRelease> "*ygv', false)

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")
