-- Global vim configs
vim.opt.autoindent = true                         -- Always set autoindenting on
vim.opt.autowrite = true                          -- Automatically write buffer before special actions
vim.opt.backup = false                            -- creates a backup file
vim.opt.clipboard = { "unnamed", "unnamedplus" }  -- allows nvim to access system clipboard
vim.opt.completeopt = { "menuone", "noselect" }   -- options for cmp
vim.opt.conceallevel = 0                          -- make `` visible in markdown files
vim.opt.hlsearch = true                           -- Highlight search matches
vim.opt.ignorecase = true                         -- Ignore case in search
vim.opt.incsearch = true                          -- Do incremental searching
vim.opt.mouse = "a"                               -- Catch mouse events in all modes
vim.opt.number = true                             -- enable lines numbering
vim.opt.pumheight = 10                            -- popup menu height
vim.opt.relativenumber = true                     -- relative lines numbering
vim.opt.showcmd = true                            -- Display incomplete commands
vim.opt.showmatch = true                          -- Show matching brackets
vim.opt.showmode = false                          -- no need to display current mode
vim.opt.signcolumn = "yes"                        -- always show sign column
vim.opt.smartcase = true                          -- Do not search everything
vim.opt.smartindent = true                        -- smarter indent
vim.opt.breakindent = true                        -- break indent
vim.opt.swapfile = false                          -- do not create swap file
vim.opt.tags = "./tags;/"                         -- Load tags in each sub directories
vim.opt.timeoutlen = 200                          -- timeout of mapped sequence
vim.opt.title = true							  -- set terminal title to current filename
vim.opt.undofile = true                           -- enable persistent undo
vim.opt.wrap = false                              -- do not wrap long lines
vim.opt.writebackup = false                       -- if a file is being edited by another program it's not allowed to be edited

vim.cmd "set whichwrap+=<,>,[,],h,l"

-- nicer blank chars display
vim.opt.listchars:append({
    tab = "»·",
    trail = "·",
    nbsp = "•",
    extends = "⟩",
    precedes = "⟨",
})

-- visual selection yanked to " register
vim.keymap.set("v", "<LeftRelease>", '"*ygv')
vim.keymap.set("v", "<RightRelease>", '"*ygv')

-- Keep search results centred
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- Make Y yank to end of the line
vim.keymap.set("n", "Y", "y$")

-- Make Y yank to end of the line
vim.keymap.set("n", "<ESC>", ":noh<cr>")

-- Force nvim to use OSC 52 clipboard provider
vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
	['+'] = require('vim.ui.clipboard.osc52').copy('+'),
	['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
	['+'] = require('vim.ui.clipboard.osc52').paste('+'),
	['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
}

