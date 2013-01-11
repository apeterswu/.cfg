" ----------------------------------------------------------------
"                       [Doxygen highling]
" ----------------------------------------------------------------
au BufNewFile,BufRead *.doxygen setfiletype doxygen
let g:doxygen_enhanced_color=0
let g:doxygen_my_rendering=0
let g:doxygen_javadoc_autobrief=1
let g:doxygen_end_punctuation='[.]'
let g:doxygenErrorComment=0
let g:doxygenLinkError=0
let g:DoxygenToolkit_authorName="Stanley Rice (Conghui He)"
map <F9> :Dox<cr>
imap <F9> <Esc>:Dox<cr>
