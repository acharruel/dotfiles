local M = {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 999,
}

function M.config()
    local status, nightfox = pcall(require, "nightfox")
    if not status then
        return
    end

    local options = {
        dim_inactive = false,
        styles = {
            comments = "italic",
            -- keywords = "bold",
            functions = "bold",
        },
    }

    nightfox.setup({
        options = options,
    })

    vim.cmd([[colorscheme nordfox]])
end

return {}
