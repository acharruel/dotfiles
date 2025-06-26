local M = {
    "danymat/neogen",
    config = true,
    cmd = "Neogen",
}

function M.config()
    require('neogen').setup({ snippet_engine = "nvim" })
end

return M
