-- nnn plugin config
require("nnn").setup({
    explorer = {
        width = 36,
    },
    picker = {
        cmd = "tmux new-session nnn -Pp",
        style = { border = "rounded" },
        session = "shared",
    },
    mappings = {
        { "<C-t>", require("nnn").builtin.open_in_tab },       -- open file(s) in tab
        { "<C-s>", require("nnn").builtin.open_in_split },     -- open file(s) in split
        { "<C-v>", require("nnn").builtin.open_in_vsplit },    -- open file(s) in vertical split
        { "<C-p>", require("nnn").builtin.open_in_preview },   -- open file in preview split keeping nnn focused
        { "<C-w>", require("nnn").builtin.cd_to_path },        -- cd to file directory
        { "<C-e>", require("nnn").builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
    },
})

-- nnn bindings
map('n', '<leader>n', '<cmd>NnnPicker<CR>')
map('n', '<leader>N', '<cmd>NnnExplorer<CR>')
