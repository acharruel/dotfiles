-- autocommands helper function
local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

-- list of autocommands
local autocmds = {
    indentation = {
        { 'BufNewFile,BufRead', '*.{tex,txt,text}', 'setlocal tw=120 ts=2 sts=2 sw=2 et list colorcolumn=0' };
        { 'BufNewFile,BufRead', '*.{html,xml,htm}', 'setlocal tw=120 ts=2 sts=2 sw=2 et list colorcolumn=120' };
        { 'BufNewFile,BufRead', '*.{c,h,cpp,hpp}',  'setlocal tw=80  ts=8 sts=8 sw=8 et! nolist colorcolumn=80' };
    };
    packer = {
        { 'BufWritePost', 'plugins.lua', 'PackerCompile' };
    };
    number_toggle = {
        { 'BufEnter, FocusGained,InsertLeave', '*', 'set relativenumber' };
        { 'BufLeave, FocusLost,InsertEnter', '*', 'set norelativenumber' };
    };
    highlight_yank = {
        { 'TextYankPost', '*', 'lua vim.highlight.on_yank({higroup="Visual", timeout="200"})' };
    };
}

-- load autocommands
nvim_create_augroups(autocmds)
