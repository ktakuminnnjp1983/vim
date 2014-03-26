function! HighlightFunc()
    syntax match myFunc /[A-Za-z_]\w*\ze(/
    syntax match myHashKey /[A-Za-z_]\w*\ze\s*:/
    syntax match myGlobalVal /\zsg_[a-zA-Z0-9_]*\ze[ ;\n.]/
    syntax match myGlobalVal2 /\zs$g_[a-zA-Z0-9_]*\ze[ ;.\n.]/
    " syntax match myDoller /\$\ze\w*\W/
    highlight myFunc ctermfg=221
    highlight myHashKey ctermfg=109
    highlight myGlobalVal ctermfg=151
    highlight myGlobalVal2 ctermfg=151
    " highlight myDoller ctermfg=215
endfunc

autocmd BufNew,BufRead javascript call HighlightFunc()
call HighlightFunc()
