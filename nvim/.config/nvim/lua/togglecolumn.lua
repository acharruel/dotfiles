local M = {}

-- Module private context
M._ctx = {}

-- Toggle colorcolumn option
--   if set colorcolumn is stored to internal context and set to 0
--   if unset colorcolumn is restored from context (if available)
M.toggle_colorcolumn = function()
    cc = vim.o.colorcolumn
    if cc == "0" then
        new_cc = "0"
        if M._ctx.prev_cc then
            new_cc = M._ctx.prev_cc
        end
        vim.o.colorcolumn = new_cc
    else
        M._ctx.prev_cc = cc
        vim.o.colorcolumn = "0"
    end
end

return M
