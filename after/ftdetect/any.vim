aug testg
  au!
  " au BufNewFile,BufRead *.xsl set filetype=html
  au BufNewFile,BufRead *.test set filetype=test
  autocmd  BufNewFile,BufRead,BufEnter *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  autocmd  BufNewFile,BufRead,BufEnter *.{aaa} set filetype=aaa
aug END
