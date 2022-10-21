-- lsp main plugin
require("lspconfig")

-- lsp helpers
require("lsp/mason-loader")
require("lsp/handlers").setup()

-- toggle diagnostics
require("toggle_lsp_diagnostics").init({ start_on = false })
