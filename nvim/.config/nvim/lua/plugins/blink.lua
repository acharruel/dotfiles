M = {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
        "L3MON4D3/LuaSnip",
        "bydlw98/blink-cmp-env",
        'rafamadriz/friendly-snippets',
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'enter' },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
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
                        { "kind_icon", "label", gap = 1 },
                    },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
                border = "rounded",
            },

            -- Show documentation when selecting a completion item
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = { border = "rounded" },
            },

            -- Display a preview of the selected item on the current line
            ghost_text = { enabled = false },
        },

        -- optionally disable cmdline completions
        cmdline = {},

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'env' },
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

        signature = {
            enabled = true,
            window = { border = "rounded" },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}

return M
