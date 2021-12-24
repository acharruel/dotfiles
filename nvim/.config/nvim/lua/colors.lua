-- colorscheme
vim.cmd 'colorscheme nightfox'

-- Nightfox config
local nightfox = require("nightfox")
nightfox.setup({
    fox = "nordfox",
    alt_nc = true,
    styles = {
        comments = "italic",
        -- keywords = "bold",
        functions = "bold",
    },
    hlgroups = {
        TSProperty = { fg = "#b9bfca" },        -- struct fields in white
        ExtraWhiteSpace = { bg = "#bf616a" },   -- extra whitespaces in nord red
    },
})
nightfox.load()
