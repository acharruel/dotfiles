local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

-- setup servers
lsp.clangd.setup {}     -- clangd for C/C++
lsp.pylsp.setup {}      -- python
lsp.gopls.setup {}      -- go
lspfuzzy.setup {}

-- toggle diagnostics
require('toggle_lsp_diagnostics').init({ start_on = false })
map('n', '<leader>d', ':ToggleDiag<CR>')
