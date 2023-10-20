local M = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
}

function M.config()
    require("ibl").setup({
        scope = { enabled = false },
    })
end

return M
