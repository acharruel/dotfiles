local M = {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
}

function M.config()
    require("illuminate").configure({
        -- providers: provider used to get references in the buffer, ordered by priority
        providers = {
            "lsp",
            "treesitter",
            "regex",
        },
        -- delay: delay in milliseconds
        delay = 300,
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
        filetypes_denylist = {
            "",
            "NvimTree",
            "Trouble",
            "dashboard",
            "help",
            "neo-tree",
            "neogitstatus",
            "packer",
            "startify",
            "text",
            "vimwiki",
        },
        large_file_cutoff = 2000,
        large_file_overrides = nil,
    })

    -- change the highlight style
    vim.api.nvim_set_hl(0, "IlluminatedWord", { underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedCurWord", { underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })

    -- auto update the highlight style on colorscheme change
    vim.api.nvim_create_autocmd({ "ColorScheme" },
        {
            pattern = { "*" },
            callback = function(_)
                vim.api.nvim_set_hl(0, "IlluminatedWord", { underline = true })
                vim.api.nvim_set_hl(0, "IlluminatedCurWord", { underline = true })
                vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
                vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
                vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
            end
        })
end

return M
