local M = {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
}

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " },
    cond = hide_in_width
}

local filetype = {
    "filetype",
    colored = false,
}

local location = function()
    local line = vim.fn.line(".")
    local total_line = vim.fn.line("$")
    local column = vim.fn.col(".")
    return tostring(line) .. "/".. tostring(total_line) .. ":" .. tostring(column)
end

local filename = {
    "filename",
    file_status = true,
    path = 1,
    shorting_target = 40,
    symbols = {
        modified = "[+]",
        readonly = "[-]",
        unnamed = "[No Name]",
    }
}

function M.config()
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "nightfox",
            section_separators = "",
            component_separators = "",
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", diff },
            lualine_c = { filename },
            lualine_x = { "encoding", filetype },
            lualine_y = { "progress" },
            lualine_z = { location }
        },
    })
end

return M
