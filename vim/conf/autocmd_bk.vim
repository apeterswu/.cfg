" [set up java]
call SetupJava()

" Highlight the column based on colorcloumn
autocmd CursorMoved *.h,*.c,*.cpp call ColumnHighlight()

autocmd BufReadPost quickfix  setlocal nobuflisted

" set the filetype syntax for mutt config files"
autocmd BufNewFile,BufRead *.muttrc set filetype=muttrc

" set the indent for lisp"
autocmd filetype lisp,scheme,art setlocal equalprg=lispindent.lisp
