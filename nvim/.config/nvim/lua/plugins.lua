local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    is_bootstrap = fn.system({"git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim", install_path})
end

return require('packer').startup(function()
    -- Packer itself
    use "wbthomason/packer.nvim"

    -- Language support plugins
    use "fladson/vim-kitty"
    use "kergoth/vim-bitbake"

    -- colorschemes
    use "EdenEast/nightfox.nvim"
    use "arcticicestudio/nord-vim"

	-- easy alignment
    use "junegunn/vim-easy-align"

	-- nnn support
    use {
        "luukvbaal/nnn.nvim",
        config = function()
            require "loader.nnn"
        end,
    }

	-- highlight whitespaces
    use "ntpeters/vim-better-whitespace"

	-- speed up plugins load time
    use {
        "lewis6991/impatient.nvim",
        config = function()
            require "loader.impatient"
        end,
    }

	-- markdown interpreter
    use {
        "ellisonleao/glow.nvim",
        config = function()
            require "loader.glow"
        end,
    }

	-- nices blank lines
    use {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require "loader.indent-blankline"
		end,
	}

	-- take notes
    use {
        "vimwiki/vimwiki",
        config = function()
            require "loader.vimwiki"
        end,
    }

	-- powerpoint style presentation
    use "sotte/presenting.vim"
    use {
        'jghauser/auto-pandoc.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('auto-pandoc')
        end
    }

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require "loader.gitsigns"
        end
    }

    --Sort motion plugins
    use "christoomey/vim-sort-motion"
    use {
        "kana/vim-textobj-entire",
        requires = {
            "kana/vim-textobj-user",
        },
    }
    use "tpope/vim-commentary"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"

    -- lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true
        },
        config = function()
            require "loader.lualine"
        end,
    }

    -- treesitter
    -- Highlight, edit, and navigate code
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        config = function()
            require "loader.treesitter"
        end,
    }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "nvim-treesitter/nvim-treesitter-context"
    use "nvim-treesitter/playground"

    -- lsp
    use "neovim/nvim-lspconfig"
    use {
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	}
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
    use "onsails/lspkind-nvim"
    use "mfussenegger/nvim-dap"
    -- Useful status updates for LSP
    use {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'},
        },
        config = function()
            require "loader.telescope"
        end,
    }

    -- cmp
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
        },
        config = function()
            require "loader.cmp"
        end,
    }

    -- snippets
    use "L3MON4D3/LuaSnip"

    -- which key
    use {
        "folke/which-key.nvim",
        config = function()
            require "loader.which-key"
        end,
    }

    -- dressing
    use "stevearc/dressing.nvim"

    -- toggle term
    use {
        "akinsho/toggleterm.nvim",
        tag = 'v2.*',
        config = function()
            require("toggleterm").setup {
                hide_numbers = true,
                shade_terminals = false,
                float_opts = {
                    border = "double",
                },
            }
            require "loader.toggleterm"
        end
    }

    -- edit quickfix content
    use "itchyny/vim-qfedit"

    -- illuminate
    use {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure({
                -- providers: provider used to get references in the buffer, ordered by priority
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                -- delay: delay in milliseconds
                delay = 300,
                -- under_cursor: whether or not to illuminate under the cursor
                under_cursor = true,
            })
        end
    }

	-- Detect tabstop and shiftwidth automatically
	use 'tpope/vim-sleuth'

    if is_bootstrap then
        require("packer").sync()
    end
end)
