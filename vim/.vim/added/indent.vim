"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    syntax on
    filetype plugin indent on

    autocmd FileType c,cpp set cindent

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent linux style
set shiftwidth=8                                         " Linux coding style
set tabstop=8                                            " Set tabstop=8
set softtabstop=8                                        " Set softtabstop=8
set textwidth=0                                          " Don't wrap words
set cino+=(0                                             " nicely indent function args after parenthesis
set cino+=:0                                             " place case statement on same column as switch
set listchars=tab:»·,trail:·,nbsp:•,extends:⟩,precedes:⟨ " nicer set list to display blank characters
set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent for xml and html files
autocmd FileType html,htm,xml setlocal tw=2 ts=2 sts=2 sw=2 et colorcolumn=120 list
