-- Nightfox config
local status, nightfox = pcall(require, "nightfox")
if not status then
    return
end

-- set colorscheme
vim.cmd 'colorscheme nordfox'

local options = {
    dim_inactive = false,
    styles = {
        comments = "italic",
        -- keywords = "bold",
        functions = "bold",
    },
}

nightfox.setup({
	options = options,
})
