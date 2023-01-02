local M = {
    "junegunn/vim-easy-align",
    event = "BufReadPost",
}

M.config = function ()
    vim.api.nvim_exec("xmap ga <Plug>(EasyAlign)", false)
    vim.api.nvim_exec("nmap ga <Plug>(EasyAlign)", false)
end

return M
