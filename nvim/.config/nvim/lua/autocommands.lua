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
    text_files = {
        { 'BufNewFile,BufRead', '*.{tex,txt}', 'setlocal tw=80 ts=2 sts=2 sw=2 et list' };
    };
    html_files = {
        { 'BufNewFile,BufRead', '*.{html,xml,htm}', 'setlocal tw=120 ts=2 sts=2 sw=2 et list colorcolumn=120' };
    };
    packer = {
        { 'BufWritePost', 'plugins.lua', 'PackerCompile' };
    };
    number_toggle = {
        { 'BufEnter,FocusGained,InsertLeave', '*', 'set relativenumber' };
        { 'BufLeave,FocusLost,InsertEnter', '*', 'set norelativenumber' };
    };
}

-- load autocommands
nvim_create_augroups(autocmds)
