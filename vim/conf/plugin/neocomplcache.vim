" ----------------------------------------------------------------
"							[NeoComplCache]
" ----------------------------------------------------------------
let g:neocomplcache_enable_at_startup            = 0 " Enable it or not
let g:neocomplcache_enable_smart_case            = 1 " case insensitive
let g:neocomplcache_enable_camel_case_completion = 1 "camel case completion
let g:neocomplcache_enable_underbar_completion   = 1 " underscore completion
let g:neocomplcache_min_syntax_length            = 3 " min length to complete
let g:neocomplcache_enable_auto_select           = 0 " auto select or not
let g:neocomplcache_force_overwrite_completefunc = 1 " overwrite completefunc
let g:neocomplcache_lock_buffer_name_pattern     = '\*fuzzyfinder\*'

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

"<CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
