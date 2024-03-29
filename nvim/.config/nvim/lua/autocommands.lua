-- Basic indent settings for know filetypes
local group = vim.api.nvim_create_augroup("CustomIndentGroup", { clear = true })
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    {
            command = "setlocal tw=120 ts=2 sts=2 sw=2 et list colorcolumn=0",
            pattern = "*.{tex,txt,text}",
            group = group,
    })
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    {
            command = "setlocal tw=120 ts=2 sts=2 sw=2 et list colorcolumn=120",
            pattern = "*.{html,xml,htm}",
            group = group,
    })
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    {
            command = "setlocal tw=80 ts=8 sts=8 sw=8 et nolist colorcolumn=80",
            pattern = "*.{c,h,cpp,hpp}",
            group = group,
    })

-- Handle relative numbers (enable only when buffer has focus)
local group = vim.api.nvim_create_augroup("CustomNumberGroup", { clear = true })
vim.api.nvim_create_autocmd(
	{ "BufEnter", "FocusGained", "InsertLeave" },
	{
		command = "set relativenumber",
		group = group,
	})
vim.api.nvim_create_autocmd(
	{ "BufLeave", "FocusLost", "InsertEnter" },
	{
		command = "set norelativenumber",
		group = group,
	})

-- Highlight selection when yanked
local group = vim.api.nvim_create_augroup("CustomYankGroup", { clear = true })
vim.api.nvim_create_autocmd({ "TextYankPost" },
	{
		command = "lua vim.highlight.on_yank({higroup='Visual', timeout='200'})",
		group = group,
	})

-- Allow presenting mode for markdown files
local group = vim.api.nvim_create_augroup("PresentingGroup", { clear = true })
vim.api.nvim_create_autocmd("Filetype",
	{
		command = "nnoremap <buffer> <F10> :PresentingStart<CR>",
		pattern = "markdown",
		group = group,
	})
vim.api.nvim_create_autocmd("Filetype",
	{
		command = "nnoremap <buffer> <F12> :.!toilet -w 200 -f term -F border<CR>",
		pattern = "markdown",
		group = group,
	})

-- Disable whitespace highlight in terminal mode
local group = vim.api.nvim_create_augroup("TerminalGroup", { clear = true })
vim.api.nvim_create_autocmd("TermEnter",
	{
		command = "DisableWhitespace",
		group = group,
	})
vim.api.nvim_create_autocmd("TermLeave",
	{
		command = "EnableWhitespace",
		group = group,
	})
