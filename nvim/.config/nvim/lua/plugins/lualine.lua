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

local context = {
    lsp_clients = {
    }
}

local function get_lsp_client_state(buffer)
    local key = tostring(buffer)
    return context.lsp_clients[key] or false
end

local function set_lsp_client_state(buffer, state)
    local key = tostring(buffer)
    context.lsp_clients[key] = state
    require('lualine').refresh()
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args) set_lsp_client_state(args.buf, true) end
})

vim.api.nvim_create_autocmd({ "BufDelete", "LspDetach" }, {
    callback = function(args) set_lsp_client_state(args.buf, nil) end
})

local function lsp()
    local buffer = vim.api.nvim_get_current_buf()
    local lsp_client = get_lsp_client_state(buffer)
    if lsp_client then
        return ""
    else
        return ""
    end
end

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
            lualine_c = {
                {
                    require("nvim-possession").status,
                    cond = function()
                        return require("nvim-possession").status() ~= nil
                    end,
                },
                filename,
            },
            lualine_x = { lsp, "encoding", filetype },
            lualine_y = { "progress" },
            lualine_z = { location }
        },
    })
end

return M
