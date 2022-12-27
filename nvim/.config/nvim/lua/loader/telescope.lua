local status, telescope = pcall(require, "telescope")
if not status then
    return
end

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                                            -- the default case_mode is "smart_case"
        }
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_mru = true,
            previewer = false,
            theme = "dropdown",
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                },
            },
            layout_config = { width = 0.8 },
        },
        find_files = {
            theme = "dropdown",
            previewer = false,
            width = 0.8,
            layout_config = { width = 0.8 },
        },
        live_grep = {
            theme = "ivy",
        },
    },
}

-- extensions
telescope.load_extension("fzf")
