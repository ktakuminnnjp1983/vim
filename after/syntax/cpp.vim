function! HighlightFunc()
    syntax match myFunc /[A-Za-z_]\w\+\((\)\@=/
    syntax match myComp /[A-Z][a-z_A-Z]\+\(\W\)\@=/
    syntax match myClass /C[A-Za-z]\w\+\(\W\)\@=/
    syntax match myEnum /E[A-Z]\w\+\(\W\)\@=/
    syntax match myfinstance /f[A-Z]\w\+\(\W\)\@=/
    syntax match myfginstance /fg[A-Z]\w\+\(\W\)\@=/
    syntax match myConst /[A-Z_][A-Z_0-9]\+\(\W\)\@=/
    
    syntax keyword myVector vector
    syntax keyword myString string
    syntax keyword myStringStream stringstream
    
    " syntax match kkk /)/
    
    highlight myFunc ctermfg=221
    highlight myComp ctermfg=173
    highlight myClass ctermfg=173
    highlight myEnum ctermfg=68
    highlight myfinstance ctermfg=136
    highlight myfginstance ctermfg=151
    highlight myConst ctermfg=182
   
    highlight myvector ctermfg=173
    highlight myString ctermfg=173
    highlight myStringStream ctermfg=173
    
    " highlight kkk ctermfg=255
endfunc

autocmd BufNew,BufRead cpp call HighlightFunc()
call HighlightFunc()
