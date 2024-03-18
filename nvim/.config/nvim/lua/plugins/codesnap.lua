local M = {
    "mistricky/codesnap.nvim", build = "make",
}

function M.config()
    require("codesnap").setup({
        mac_window_bar = false,
        opactiy = 80,
        watermark = "Sample code",
        editor_font_family = "Hack Nerd Font",
        watermark_font_family = "Hack Nerd Font",
    })
end

return M
