"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","       " Define leader character
let maplocalleader=","  " May be different than mapleader

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key map
nmap <Leader>h       :noh<CR>               " Turn off match highlighting
nmap <Leader>w       :StripWhitespace<CR>   " Remove white spaces at EOL
nmap <Leader>eol     :%s///gc<CR>         " Remove Windows EOL symbols
nmap <Leader><left>  :tabprevious<CR>       " map tab previous to ,LEFTARROW
nmap <Leader><right> :tabnext<CR>           " map tab next to ,RIGHTARROW
nmap <Leader>n       :tabnew<CR>            " map tab new to ,n
nmap <Leader>nn      :tabnew %<CR>          " map tab new with same buffer to ,nn

" threadx
nmap <Leader>tx :setlocal tw=100 ts=4 sts=4 sw=4 et colorcolumn=100 list<CR>
" gstreamer
nmap <Leader>gst :setlocal tw=80 ts=2 sts=2 sw=2 et colorcolumn=80 list<CR>
" meson
nmap <Leader>meson :setlocal tw=80 ts=8 sts=2 sw=2 noet colorcolumn=80 list<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>c :Commits<CR>
nmap <Leader>C :BCommits<CR>

" fzf with cscope
function! CscopeLoad()
    call system('cscope -s . -R -q -b')
endfunction

nnoremap <silent> <Leader>u :Cscope 3 <c-r>=expand("<cword>")<cr><cr>
nnoremap <silent> <Leader>i :Cscope 4 <c-r>=expand("<cword>")<cr><cr>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/vimplug/fzf.vim/bin/preview.sh {}']}, <bang>0)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
