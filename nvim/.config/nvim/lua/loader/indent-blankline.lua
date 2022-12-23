local status, blank_line = pcall(require, "blank_line")
if not status then
    return
end

blank_line.setup {
	show_trailing_blankline_indent = false,
}
