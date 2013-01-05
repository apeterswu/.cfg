" 						Plugins Configuration:
" ----------------------------------------------------------------
"							[A]
" ----------------------------------------------------------------
nnoremap <silent> <F4> :A<CR>

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

" ----------------------------------------------------------------
"                           [TagBar]
" ----------------------------------------------------------------
nmap <leader>tb :TagbarToggle<cr>
let g:tagbar_left=0

" ----------------------------------------------------------------
"                           [MiniBuffer]
" ----------------------------------------------------------------
let g:miniBufExplTabWrap = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMaxSize = 2
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

" ----------------------------------------------------------------
"                           [Grep]
" ----------------------------------------------------------------
nnoremap <silent> <F3> :Grep<cr><cr><cr>

" ----------------------------------------------------------------
"							[NeoComplCache]
" ----------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"

" ----------------------------------------------------------------
"							[clang-complete]
" ----------------------------------------------------------------
let g:clang_complete_copen = 0
let g:clang_snippets = 1
let g:clang_snippets_engine = 'snipmate'
let g:clang_trailing_placeholder = 1
let g:clang_complete_macros = 1

" ----------------------------------------------------------------
"							[syntatic]
" ----------------------------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 0

" ----------------------------------------------------------------
"							[Fuzzy-Finder]
" ----------------------------------------------------------------
noremap <silent> <leader>ff :FufFile<cr>
noremap <silent> <leader>fb :FufBuffer<cr>
