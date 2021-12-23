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
})
nightfox.load()
