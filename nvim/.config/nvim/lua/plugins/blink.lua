local M = {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    "L3MON4D3/LuaSnip",
    "bydlw98/blink-cmp-env",
    'rafamadriz/friendly-snippets',
  },
  version = 'v0.11.0',

  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = { preset = 'enter' },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'env' },
      -- optionally disable cmdline completions
      cmdline = {},
      providers = {
        env = {
          name = "Env",
          module = "blink-cmp-env",
          opts = {
            -- item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
            show_braces = false,
            show_documentation_window = true,
          },
        },
        snippets = {
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= 'trigger_character'
          end
        },
      },
    },

    -- experimental signature help support
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },

    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      menu = {
        draw = {
          columns = {
            { "kind_icon", "label", "label_description", gap = 1 },
            { "kind", gap = 1 },
          },
        },
        border = "rounded",
      },

      -- Show documentation when selecting a completion item
      documentation = {
        auto_show = true, auto_show_delay_ms = 500,
        window = { border = "rounded" },
      },

      -- Display a preview of the selected item on the current line
      ghost_text = { enabled = false },
    },

  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" },

}

return M
