local M = {
    "chrisgrieser/nvim-various-textobjs",
}

function M.config()
    require("various-textobjs").setup({ useDefaultKeymaps = true })
end

return M
