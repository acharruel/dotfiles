-- lsp main plugin
require("lspconfig")

-- lsp helpers
require("lsp/lsp-installer")
require("lsp/handlers").setup()

-- lsp fuzzy
local lspfuzzy = require 'lspfuzzy'
lspfuzzy.setup {}

-- toggle diagnostics
require('toggle_lsp_diagnostics').init({ start_on = false })
