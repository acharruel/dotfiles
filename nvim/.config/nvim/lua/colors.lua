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

local groups = {
	all = {
		TSProperty = { fg = "#b9bfca" },        -- struct fields in white
	},
}

nightfox.setup({
	options = options,
	groups = groups,
})
