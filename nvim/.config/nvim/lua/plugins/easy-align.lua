local M = {
    "junegunn/vim-easy-align",
    event = "BufReadPost",
}

M.config = function ()
    vim.api.nvim_exec2("xmap ga <Plug>(EasyAlign)", { output = false })
    vim.api.nvim_exec2("nmap ga <Plug>(EasyAlign)", { output = false })
end

return M
