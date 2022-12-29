local M = {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["b"] = { "<cmd>Telescope buffers<cr>", "[B]uffers" },
    ["f"] = { "<cmd>Telescope find_files<cr>", "[F]ind files" },
    ["F"] = { "<cmd>Telescope live_grep<cr>", "[F]ind Text" },
    ["g"] = { "<cmd>Telescope grep_string<cr>", "[G]rep String" },

    s = {
        name = "Telescope [S]earch",
        c = { "<cmd>Telescope colorscheme<cr>", "[C]olorscheme" },
        C = { "<cmd>Telescope commands<cr>", "[C]ommands" },
        d = { "<cmd>Telescope diagnostics<cr>", "[D]iagnostics" },
        h = { "<cmd>Telescope help_tags<cr>", "Find [H]elp" },
        k = { "<cmd>Telescope keymaps<cr>", "[K]eymaps" },
        M = { "<cmd>Telescope man_pages<cr>", "[M]an Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open [R]ecent File" },
        R = { "<cmd>Telescope registers<cr>", "[R]egisters" },
    },
}

function M.init()
    -- register mappings
    local wk = require("which-key")
    wk.register(mappings, opts)
end

function M.config()
    require("telescope").setup({
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
    })

    -- extensions
    require("telescope").load_extension("fzf")
end

return M
