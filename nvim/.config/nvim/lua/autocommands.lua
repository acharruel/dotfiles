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

local group = vim.api.nvim_create_augroup("CustomPackerGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost",
	{
		command = "PackerCompile",
		pattern = "plugins.lua",
		group = group
	})

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

local group = vim.api.nvim_create_augroup("CustomYankGroup", { clear = true })
vim.api.nvim_create_autocmd({ "TextYankPost" },
	{
		command = "lua vim.highlight.on_yank({higroup='Visual', timeout='200'})",
		group = group,
	})

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
