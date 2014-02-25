function! HighlightFunc()
    syntax match myFunc /[A-Za-z_]\w*\ze(/
    syntax match myHashKey /[A-Za-z_]\w*\ze\s*:/
    syntax match myGlobalVal /g_\w*\ze\W/
    syntax match myDoller /\$\ze\w*\W/
    highlight myFunc ctermfg=221
    highlight myHashKey ctermfg=109
    highlight myGlobalVal ctermfg=151
    highlight myDoller ctermfg=215
endfunc

autocmd BufNew,BufRead javascript call HighlightFunc()
call HighlightFunc()
