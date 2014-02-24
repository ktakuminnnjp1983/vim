function! HighlightFunc()
    syntax match myFunc /[^"a-zA-Z0-9][A-Za-z_]\w\+\ze(/
    syntax match myComp /[^"a-zA-Z0-9][A-Z][a-z_A-Z]\+\ze\W/
    syntax match myComp2 /^[A-Z][a-z_A-Z]\+\ze\W/
    syntax match myClass /[^"a-zA-Z0-9]C[A-Za-z]\w\+\ze\W/
    syntax match myClass2 /^C[A-Za-z]\w\+\ze\W/
    syntax match myEnum /[^"a-zA-Z0-9]E[A-Z]\w\+\ze\W/
    syntax match myfinstance /[^"a-zA-Z0-9]f[A-Z]\w\+\ze\W/
    syntax match myfginstance /[^"a-zA-Z0-9]fg[A-Z]\w\+\ze\W/
    syntax match myConst /[^"a-zA-Z0-9][A-Z_][A-Z_0-9]\+ze\W/
    
    syntax keyword myVector vector
    syntax keyword myString string
    syntax keyword myStringStream stringstream
    
    syntax match kkk /)/
    
    highlight myFunc ctermfg=221
    highlight myComp ctermfg=173
    highlight myComp2 ctermfg=173
    highlight myClass ctermfg=173
    highlight myClass2 ctermfg=173
    highlight myEnum ctermfg=68
    highlight myfinstance ctermfg=136
    highlight myfginstance ctermfg=151
    highlight myConst ctermfg=182
   
    highlight myvector ctermfg=173
    highlight myString ctermfg=173
    highlight myStringStream ctermfg=173
    
    highlight kkk ctermfg=255
endfunc

autocmd BufNew,BufRead cpp call HighlightFunc()
call HighlightFunc()
