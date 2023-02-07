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
        large_file_overrides = nil,
    })
end

return M
