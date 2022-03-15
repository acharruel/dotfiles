-- leader key for custom actions
vim.g.mapleader = ','

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
vim.opt.swapfile = false                          -- do not create swap file
vim.opt.tags = "./tags;/"                         -- Load tags in each sub directories
vim.opt.timeoutlen = 200                          -- timeout of mapped sequence
vim.opt.undofile = true                           -- enable persistent undo
vim.opt.wrap = false                              -- do not wrap long lines
vim.opt.writebackup = false                       -- if a file is being edited by another program it's not allowed to be edited
vim.opt.wrapscan = false                          -- do not wrap searches

vim.cmd "set whichwrap+=<,>,[,],h,l"

-- indent linux style
vim.opt.colorcolumn = '100'                       -- set column to 100 chars
vim.opt.shiftwidth = 4                            -- insert 4 spaces for a tab
vim.opt.tabstop = 4                               -- tab are 4 spaces wide
vim.opt.softtabstop = 4
vim.opt.textwidth = 0
vim.opt.cino:append({
        '(0',   -- nicely indent function args after parenthesis
        ':0'    -- place case statement on same column as switch
})

-- nicer blank chars display
vim.opt.listchars:append({
    tab = "»·",
    trail = "·",
    nbsp = "•",
    extends = "⟩",
    precedes = "⟨",
})

-- enable better whitespace
vim.g.better_whitespace_enabled = 1
vim.g.better_whitespace_operator = ""
