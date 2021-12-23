-- setup lsp installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

-- lsp fuzzy
local lspfuzzy = require 'lspfuzzy'
lspfuzzy.setup {}

-- toggle diagnostics
require('toggle_lsp_diagnostics').init({ start_on = false })
map('n', '<leader>d', ':ToggleDiag<CR>')
