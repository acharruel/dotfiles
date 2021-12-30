local status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter_configs.setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
    indent = {enable = true},
}
