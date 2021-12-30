local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " },
    cond = hide_in_width
}

local filetype = {
    "filetype",
    colored = false,
}

-- lualine plugin config
lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", diff },
    lualine_c = { "filename", diagnostics },
    lualine_x = { filetype },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
}
