-- leader key for custom actions
vim.g.mapleader = ','

-- plugins manager
require "lazy_bootstrap"

-- define auto commands
require "autocommands"

-- some useful helper functions
require "helpers"

-- vim global options
require "options"

-- custom plugin
local status, rg = pcall(require, "custom.multi-ripgrep")
if status then
    rg.setup()
end
