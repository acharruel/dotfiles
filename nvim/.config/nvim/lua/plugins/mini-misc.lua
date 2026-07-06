local M = {
  'nvim-mini/mini.misc',
  version = '*',
}

function M.config()
  require('mini.misc').setup({
    -- Array of fields to make global (to be used as independent variables)
    make_global = { 'put', 'put_text' },
  })
end

return M
