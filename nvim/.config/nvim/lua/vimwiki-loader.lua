vim.g.vimwiki_list = {
	{
		path = "~/documents/vimwiki",
		syntax = "markdown",
		ext = ".md",
	}
}

vim.g.vimwiki_global_ext = 0
-- vim.g.vimwiki_key_mappings = {
-- 	all_maps = 0, -- disable all key mappings
-- }

local M = {}

M.launch_browser = function()
	local filename = vim.api.nvim_buf_get_name(0)
	local html = filename.gsub(filename, ".md", ".html")
	if filename ~= html then
		os.execute("google-chrome \""..html.."\"".." 2> /dev/null")
	end
end

return M
