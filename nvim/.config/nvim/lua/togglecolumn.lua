local M = {}

-- Module private context
M._ctx = {}

-- Toggle colorcolumn option
--   if unset colorcolumn is restored from context (if available)
--   if set colorcolumn is stored to internal context and set to 0
M.toggle_colorcolumn = function()
    cc = vim.o.colorcolumn
    if cc == "0" then
        vim.o.colorcolumn = M._ctx.prev_cc or "0"
    else
        M._ctx.prev_cc = cc
        vim.o.colorcolumn = "0"
    end
end

return M
