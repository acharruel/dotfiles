local M = {
  "folke/trouble.nvim",
  opts = {
    modes = {
      symbols = {             -- Configure symbols mode
        win = {
          type = "split",     -- split window
          relative = "win",   -- relative to current window
          position = "right", -- right side
          size = 0.4,         -- 30% of the window
        },
      },
    },
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}

function M.init()
  local status, wk = pcall(require, "which-key")
  if not status then return end
  wk.add({ "<leader>x", group = "Trouble", icon = "" })
end

return M
