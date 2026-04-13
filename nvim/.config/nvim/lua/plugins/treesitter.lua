local M = {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
}

function M.config()
    local status, treesitter_context = pcall(require, "treesitter-context")
    if not status then
        print("Error require 'treesitter-context'")
        return
    end

    treesitter_context.setup {
        enable = true,        -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        patterns = {          -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            default = {
                'class',
                'function',
                'method',
                -- 'for', -- These won't appear in the context
                -- 'while',
                -- 'if',
                -- 'switch',
                -- 'case',
            },
        },

        zindex = 20,     -- The Z-index of the context window
        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
    }

    local function is_parser_installed(lang)
        local installed = require("nvim-treesitter").get_installed()
        return vim.tbl_contains(installed, lang)
    end

    local function is_parser_available(lang)
        local available = require("nvim-treesitter").get_available()
        return vim.tbl_contains(available, lang)
    end

    local function start_treesitter(buf, lang)
        if not vim.treesitter.language.add(lang) then
            vim.notify(
                "Cannot load treesitter parser for language " .. lang,
                vim.log.levels.WARN
            )
            return
        end
        vim.treesitter.start(buf)
        vim.bo[buf].syntax = "ON"
        if vim.treesitter.query.get(lang, "indents") then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end

    vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
            local lang = vim.treesitter.language.get_lang(ev.match)
            if not lang then
                return
            end
            local buf = ev.buf
            if is_parser_installed(lang) then
                start_treesitter(buf, lang)
            elseif is_parser_available(lang) then
                require("nvim-treesitter").install({ lang }):await(function()
                    start_treesitter(buf, lang)
                end)
            end
        end,
    })
end

return M
