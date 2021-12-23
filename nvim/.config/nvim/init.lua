-- key mapping helper function
function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- leader key for custom actions
vim.g.mapleader = ','

-- plugins definition
require('plugins')

-- vim generic options
require('options')

-- custom key mappings
require('mappings')

-- vim autocommands
require('autocommands')

-- colors
require('colors')

-- plugins configs
require('cmp-loader')
require('gitsigns-loader')
require('lsp-loader')
require('lualine-loader')
require('nnn-loader')
require('telescope-loader')
require('treesitter-loader')
