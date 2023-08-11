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

local diagnostics = {
    "diagnostics",
    colored = false,
}

local location = function()
    local line = vim.fn.line(".")
    local total_line = vim.fn.line("$")
    local column = vim.fn.col(".")
    return tostring(line) .. "/" .. tostring(total_line) .. ":" .. tostring(column)
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

local function lsp()
    local filter = { bufnr = vim.api.nvim_get_current_buf() }
    local clients = vim.lsp.get_clients(filter)
    if #clients > 1 then
        return ""..#clients
    elseif #clients == 1 then
        return ""
    else
        return ""
    end
end

function M.config()
    require("lualine").setup({
        options = {
            icons_enabled = true,
            section_separators = "",
            component_separators = "",
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                {
                    require("nvim-possession").status,
                    cond = function()
                        return require("nvim-possession").status() ~= nil
                    end,
                },

                "branch",
                diff },
            lualine_c = {
                filename,
                diagnostics,
            },
            lualine_x = { lsp, "encoding", filetype },
            lualine_y = { "progress" },
            lualine_z = { location }
        },
        extensions = {
            "lazy",
            "nvim-dap-ui",
            "quickfix",
            "toggleterm",
            "trouble",
        },
    })
end

return M
