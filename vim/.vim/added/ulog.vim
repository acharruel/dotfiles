" Vim syntax file
" Language:         ulog
" Maintainer:       Adrien Charruel <adrien.charruel@parrot.com>
" Latest Revision:  2015-01-20

if exists("b:current_syntax")
    finish
endif

" colors
hi def ulog_critical_color	ctermfg=white ctermbg=red guifg=white guibg=red
hi def ulog_error_color		ctermfg=red guifg=red
hi def ulog_warning_color	ctermfg=yellow guifg=yellow
hi def ulog_info_color		ctermfg=gray guifg=gray
hi def ulog_debug_color		ctermfg=darkgray guifg=gray
hi def ulog_verbose_color	ctermfg=darkgray guifg=gray
hi def ulog_tag_color		ctermfg=white guifg=white

" text log definitions
syn match ulog_critical		/\vC .*/ nextgroup=ulog_error skipwhite contains=ulog_process
syn match ulog_error		/\vE .*/ nextgroup=ulog_warning skipwhite contains=ulog_process
syn match ulog_warning		/\vW .*/ nextgroup=ulog_info skipwhite contains=ulog_process
syn match ulog_info		/\vI .*/ nextgroup=ulog_debug skipwhite contains=ulog_process
syn match ulog_debug		/\vD .*/ nextgroup=ulog_verbose skipwhite contains=ulog_process
syn match ulog_verbose		/\vV .*/ contains=ulog_process

syn match ulog_date		/\v\d\d-\d\d \d\d:\d\d:\d\d.\d\d\d/ nextgroup=ulog_critical skipwhite
syn match ulog_tag		/\v^[A-Z]/ nextgroup=ulog_date skipwhite

syn match ulog_process		/\s.*([a-zA-Z0-9_-]*\/[a-zA-Z0-9_-]*)\s*:\s/ contained

hi def link ulog_critical	ulog_critical_color
hi def link ulog_error		ulog_error_color
hi def link ulog_warning	ulog_warning_color
hi def link ulog_info		ulog_info_color
hi def link ulog_debug		ulog_debug_color
hi def link ulog_verbose	ulog_verbose_color
hi def link ulog_tag		ulog_tag_color
hi def link ulog_date		Statement
hi def link ulog_process	Title

let b:current_syntax="ulog"
