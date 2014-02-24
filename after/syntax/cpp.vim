function! HighlightFunc()
    " なぜか(\zsが認識されない..
    syntax match myFunc /[^("a-zA-Z0-9]\zs[A-Za-z_]\w\+\ze(/
    syntax match myFunc2 /([A-Za-z_]\w\+\ze(/
    syntax match myFunc3 /[^("a-zA-Z0-9]\zs[A-Za-z_]\w\+\ze<.*>(/
    syntax match myFunc4 /([A-Za-z_]\w\+\ze<.*>(/
    syntax match myComp /[^("a-zA-Z0-9]\zs[A-Z][a-z_A-Z]\+\ze\W/
    syntax match myComp2 /([A-Z][a-z_A-Z]\+\ze\W/
    syntax match myComp3 /^[A-Z][a-z_A-Z]\+\ze\W/
    syntax match myClass /[^("a-zA-Z0-9]\zsC[A-Za-z]\w\+\ze\W/
    syntax match myClass2 /(C[A-Za-z]\w\+\ze\W/
    syntax match myClass3 /^C[A-Za-z]\w\+\ze\W/
    syntax match myEnum /[^("a-zA-Z0-9]\zsE[A-Z]\w\+\ze\W/
    syntax match myEnum2 /(E[A-Z]\w\+\ze\W/
    syntax match myEnumVal /[^("a-zA-Z0-9]\zse[A-Z]\w*/
    syntax match myEnumVal2 /(e[A-Z]\w*/
    syntax match myfinstance /[^("a-zA-Z0-9]\zsf[A-Z]\w\+\ze\W/
    syntax match myfinstance2 /(f[A-Z]\w\+\ze\W/
    syntax match myfginstance /[^("a-zA-Z0-9]\zsfg[A-Z]\w\+\ze\W/
    syntax match myfginstance2 /(fg[A-Z]\w\+\ze\W/
    syntax match myConst /[^("a-zA-Z0-9]\zs[A-Z_][A-Z_0-9]\+\ze\W/
    syntax match myConst2 /([A-Z_][A-Z_0-9]\+\ze\W/
    syntax match myConstVal /[^("a-zA-Z0-9]\zsk[A-Z]\w*/
    syntax match myConstVal2 /(k[A-Z]\w*/
    syntax match myTest /<\zs Test \ze>/
    
    syntax keyword myVector vector
    syntax keyword myString string
    syntax keyword myStringStream stringstream
    
    syntax match kkk /)/
    
    highlight myTest ctermfg=221
    highlight myFunc ctermfg=221
    highlight myFunc2 ctermfg=221
    highlight myFunc3 ctermfg=221
    highlight myFunc4 ctermfg=221
    highlight myComp ctermfg=173
    highlight myComp2 ctermfg=173
    highlight myComp3 ctermfg=173
    highlight myClass ctermfg=173
    highlight myClass2 ctermfg=173
    highlight myClass3 ctermfg=173
    highlight myEnum ctermfg=68
    highlight myEnum2 ctermfg=68
    highlight myEnumVal ctermfg=68
    highlight myEnumVal2 ctermfg=68
    highlight myfinstance ctermfg=136
    highlight myfinstance2 ctermfg=136
    highlight myfginstance ctermfg=151
    highlight myfginstance2 ctermfg=151
    highlight myConst ctermfg=182
    highlight myConst2 ctermfg=182
    highlight myConstVal ctermfg=182
    highlight myConstVal2 ctermfg=182
   
    highlight myvector ctermfg=173
    highlight myString ctermfg=173
    highlight myStringStream ctermfg=173
    
    highlight kkk ctermfg=255
endfunc

autocmd BufNew,BufRead cpp call HighlightFunc()
call HighlightFunc()
