local M = {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    ["b"] = { "<cmd>Telescope buffers<cr>", "[B]uffers" },
    ["f"] = { "<cmd>Telescope find_files<cr>", "[F]ind files" },
    ["F"] = { "<cmd>Telescope live_grep<cr>", "[F]ind Text" },
    -- ["g"] = { "<cmd>Telescope grep_string<cr>", "[G]rep String" },
    ["g"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "[G]rep String" },

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
    local status_actions, actions = pcall(require, "telescope.actions")
    if not status_actions then return end

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
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("live_grep_args")
end

return M
