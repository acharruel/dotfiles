local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim", install_path})
end

return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Language support plugins
    use "adelarsq/vim-matchit"
    use "fladson/vim-kitty"
    use "kergoth/vim-bitbake"

    -- colorschemes
    use "rebelot/kanagawa.nvim"
    use "EdenEast/nightfox.nvim"
    use "altercation/vim-colors-solarized"
    use "arcticicestudio/nord-vim"
    use "folke/tokyonight.nvim"
    use "sainnhe/everforest"

    -- Functionnalities plugins
    use "farmergreg/vim-lastplace"
    use {
        "junegunn/fzf.vim",
        requires = {"junegunn/fzf", run = function() vim.fn["fzf#install"]() end}
    }
    use "junegunn/vim-easy-align"
    use {
        "luukvbaal/nnn.nvim",
        config = function()
            require "loader.nnn"
        end,
    }
    use "ntpeters/vim-better-whitespace"
    use "vim-scripts/a.vim"
    use {
        "lewis6991/impatient.nvim",
        config = function()
            require "loader.impatient"
        end,
    }
    use {
        "ellisonleao/glow.nvim",
        config = function()
            require "loader.glow"
        end,
    }
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "vimwiki/vimwiki",
        config = function()
            require "loader.vimwiki"
        end,
    }
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
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
        config = function()
            require "loader.telescope"
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

    if packer_bootstrap then
        require("packer").sync()
    end
end)
