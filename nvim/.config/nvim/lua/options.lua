-- leader key for custom actions
vim.g.mapleader = ','

-- Global vim configs
vim.opt.autoindent = true                      -- Always set autoindenting on
vim.opt.autowrite = true                       -- Automatically write buffer before special actions
vim.opt.hlsearch = true                        -- Highlight matches
vim.opt.incsearch = true                       -- Do incremental searching
vim.opt.showcmd = true                         -- Display incomplete commands
vim.opt.showmatch = true                       -- Show matching brackets
vim.opt.ignorecase = true                      -- Ignore case in search
vim.opt.smartcase = true                       -- Do not search everything
vim.opt.switchbuf = 'useopen,split'            -- Want better buffer handling in quickfix mode
vim.opt.visualbell = true                      -- No beeps - don't want to annoy neighbours
vim.opt.whichwrap = '<,>,[,]'                  -- Allow to switch lines with arrows
vim.opt.bg = 'dark'                            -- Dark background
vim.opt.tags = './tags;/'                      -- Load tags in each sub directories
vim.opt.mouse = 'a'                            -- Catch mouse events in all modes
vim.opt.writebackup = true                     -- backup in case of error
vim.opt.undodir = '~/.vim/undodir'             -- undo directory for persistent undo
vim.opt.number = true                          -- enable lines numbering
vim.opt.relativenumber = true                  -- relative lines numbering
vim.opt.clipboard = {'unnamed', 'unnamedplus'} -- clipboard config for copy/paste
vim.opt.colorcolumn = '80'                     -- set column to 80 chars
vim.opt.timeoutlen = 200                       -- timeout of mapped sequence

-- indent linux style
vim.opt.shiftwidth = 8  -- tabs are 8 chars wide
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.textwidth = 0
vim.opt.cino:append({
        '(0',   -- nicely indent function args after parenthesis
        ':0'    -- place case statement on same column as switch
})

-- nicer blank chars display
vim.opt.listchars:append({
    tab = '»·',
    trail = '·',
    nbsp = '•',
    extends = '⟩',
    precedes = '⟨',
})

-- enable better whitespace
vim.g.better_whitespace_enabled = 1
