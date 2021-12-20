require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
    -- textobjects = {
    --     select = {
    --         enable = true,
    --         keymaps = {
    --             ['aa'] = '@parameter.outer', ['ia'] = '@parameter.inner',
    --             ['af'] = '@function.outer', ['if'] = '@function.inner',
    --         },
    --     },
    --     move = {
    --         enable = true,
    --         goto_next_start = {[']a'] = '@parameter.outer', [']f'] = '@function.outer'},
    --         goto_next_end = {[']A'] = '@parameter.outer', [']F'] = '@function.outer'},
    --         goto_previous_start = {['[a'] = '@parameter.outer', ['[f'] = '@function.outer'},
    --         goto_previous_end = {['[A'] = '@parameter.outer', ['[F'] = '@function.outer'},
    --     },
    -- },
}
