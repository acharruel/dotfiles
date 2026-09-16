local M = {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  init = function()
    vim.g.no_plugin_maps = true
  end,
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        enable = true,
        lookahead = true,
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V",  -- linewise
        },
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true,
      },
    })

    -- Selection Keymaps
    local sel = require("nvim-treesitter-textobjects.select")
    vim.keymap.set({ "x", "o" }, "af", function() sel.select_textobject("@function.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "if", function() sel.select_textobject("@function.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ac", function() sel.select_textobject("@class.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ic", function() sel.select_textobject("@class.inner", "textobjects") end)

    -- Parameter Selection (using 'a' for argument)
    vim.keymap.set({ "x", "o" }, "aa", function() sel.select_textobject("@parameter.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ia", function() sel.select_textobject("@parameter.inner", "textobjects") end)

    -- Swapping Keymaps
    local swap = require("nvim-treesitter-textobjects.swap")
    vim.keymap.set("n", "sp", function() swap.swap_next("@parameter.inner") end,
      { desc = "Swap parameter with next" })
    vim.keymap.set("n", "Sp", function() swap.swap_previous("@parameter.inner") end,
      { desc = "Swap parameter with previous" })
  end,
}

return M
