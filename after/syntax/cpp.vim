function! HighlightFunc()
    syntax match myFunc /[A-Za-z_]\w*\((\)\@=/
    syntax match myFunc2 /[ (]\w*\(<.*>(\)\@=/
    syntax match myComp /[ (][A-Z][a-z_A-Z]*\(\W\)\@=/
    syntax match myComp2 /^[A-Z][a-z_A-Z]*\(\W\)\@=/
    syntax match myClass /[ (]C[A-Za-z]\w*\(\W\)\@=/
    syntax match myClass2 /^C[A-Za-z]\w*\(\W\)\@=/
    syntax match myEnum /[ (]E[A-Z]\w*\(\W\)\@=/
    syntax match myEnum2 /^E[A-Z]\w*\(\W\)\@=/
    syntax match myfinstance /[ (]f[A-Z]\w*\(\W\)\@=/
    syntax match myfinstance2 /^f[A-Z]\w*\(\W\)\@=/
    syntax match myfginstance /[ (]fg[A-Z]\w*\(\W\)\@=/
    syntax match myfginstance2 /^fg[A-Z]\w*\(\W\)\@=/
    syntax match myConst /^[A-Z_][A-Z_0-9]\+\(\W\)\@=/
    syntax match myConst2 /[ (][A-Z_][A-Z_0-9]\+\(\W\)\@=/
    syntax match myConst3 /[ (][A-Z_][A-Z_0-9]\+$/
    
    syntax keyword myVector vector
    syntax keyword myString string
    syntax keyword myStringStream stringstream
    
    " syntax match kkk /)/
    
    highlight myFunc ctermfg=221
    highlight myFunc2 ctermfg=221
    highlight myComp ctermfg=173
    highlight myComp2 ctermfg=173
    highlight myClass ctermfg=173
    highlight myClass2 ctermfg=173
    highlight myEnum ctermfg=68
    highlight myEnum2 ctermfg=68
    highlight myfinstance ctermfg=136
    highlight myfinstance2 ctermfg=136
    highlight myfginstance ctermfg=151
    highlight myfginstance2 ctermfg=151
    highlight myConst ctermfg=182
    highlight myConst2 ctermfg=182
    highlight myConst3 ctermfg=182
   
    highlight myvector ctermfg=173
    highlight myString ctermfg=173
    highlight myStringStream ctermfg=173
    
    " highlight kkk ctermfg=255
endfunc

autocmd BufNew,BufRead cpp call HighlightFunc()
call HighlightFunc()
