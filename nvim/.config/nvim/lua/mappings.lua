-- key mapping helper function
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- EasyAlign
vim.api.nvim_exec("xmap ga <Plug>(EasyAlign)", false)
vim.api.nvim_exec("nmap ga <Plug>(EasyAlign)", false)

-- visual selection yanked to " register
vim.api.nvim_exec('vmap <LeftRelease> "*ygv', false)
vim.api.nvim_exec('vmap <RightRelease> "*ygv', false)

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")
