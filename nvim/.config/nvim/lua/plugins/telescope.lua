local M = {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },
    keys = {
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "[B]uffers" },
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find [F]iles" },
        {
            "<leader>g", "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>",
            desc = "[G]rep Word Under Cursor",
        },
        {
            "<leader>F", "<cmd>lua require('custom.multi-ripgrep')<cr>",
            desc = "[F]ind String with grep",
        },
        { "<leader>r", "<cmd>Telescope resume<cr>", desc = "[R]esume Telescope Search" },

        { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "[C]olorscheme Search" },
        { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "[C]ommands Search" },
        { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[D]iagnostics Search" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[H]elp Search" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[K]eymaps Search" },
        { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "[M]an Pages Search" },
        { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "[R]ecently Opened Files Search" },
        { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "[R]egisters Search" },
    },
}

function M.init()
    local status, wk = pcall(require, "which-key")
    if not status then return end
    wk.add({ "<leader>s", group = "Telescope [S]earch" })
end

function M.config()
    local actions = require("telescope.actions")
    local transform_mod = require('telescope.actions.mt').transform_mod
    local local_actions = {}

    local_actions.open_trouble_quickfix = function()
        require("trouble").open("quickfix")
    end

    local_actions = transform_mod(local_actions)
    require("telescope").setup({
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            multi_icon = "",
            mappings = {
                i = {
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    ["<C-t>"] = actions.smart_send_to_qflist + local_actions.open_trouble_quickfix,
                },
                n = {
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    ["<C-t>"] = actions.smart_send_to_qflist + local_actions.open_trouble_quickfix,
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
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
    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("ui-select")
end

return M
