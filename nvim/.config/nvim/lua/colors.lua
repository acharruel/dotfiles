-- Nightfox config
-- local status, nightfox = pcall(require, "nightfox")
-- if not status then
--     return
-- end

local status, gruvbox = pcall(require, "gruvbox")
if not status then
    return
end

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = true,
  transparent_mode = false,
})

-- set colorscheme
vim.cmd 'colorscheme gruvbox'

-- local options = {
--     dim_inactive = false,
--     styles = {
--         comments = "italic",
--         -- keywords = "bold",
--         functions = "bold",
--     },
-- }

-- nightfox.setup({
-- 	options = options,
-- })
