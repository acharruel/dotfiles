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
    use "luukvbaal/nnn.nvim"
    use "ntpeters/vim-better-whitespace"
    use "vim-scripts/a.vim"
    use "lewis6991/impatient.nvim"
    use "ellisonleao/glow.nvim"
    use "lukas-reineke/indent-blankline.nvim"
	use "vimwiki/vimwiki"
	use "sotte/presenting.vim"
	use {
		'jghauser/auto-pandoc.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require('auto-pandoc')
		end
	}
	use {
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup {
				log_level = 'info',
				auto_session_suppress_dirs = {'~'},
			}
		end
	}

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
    }

    --Sort motion plugins
    use "christoomey/vim-sort-motion"
    use {
		"kana/vim-textobj-entire",
		requires = { use "kana/vim-textobj-user" },
	}
    use "tpope/vim-commentary"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"

    -- lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- treesitter
    use {
		"nvim-treesitter/nvim-treesitter",
		run = ':TSUpdate',
	}
	use "nvim-treesitter/nvim-treesitter-textobjects"
	use "nvim-treesitter/nvim-treesitter-context"
	use "nvim-treesitter/playground"

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
    use "onsails/lspkind-nvim"
    use "jose-elias-alvarez/null-ls.nvim"

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'}
        },
    }

    -- cmp
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-nvim-lsp'
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lua"

    -- snippets
    use "L3MON4D3/LuaSnip"

    -- which key
    use "folke/which-key.nvim"

    -- harpoon
    use "ThePrimeagen/harpoon"

	-- dressing
	use "stevearc/dressing.nvim"


    if packer_bootstrap then
        require("packer").sync()
    end
end)
