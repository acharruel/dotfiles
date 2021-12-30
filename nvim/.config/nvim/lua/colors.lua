-- Nightfox config
local status, nightfox = pcall(require, "nightfox")
if not status then
    return
end

-- set colorscheme
vim.cmd 'colorscheme nightfox'

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

