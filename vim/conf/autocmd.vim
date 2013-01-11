"                           Auto Commands:
" ----------------------------------------------------------------
au InsertEnter * call InsertStatuslineColor(v:insertmode)

" switch color between insert mode and normal mode
au InsertLeave * hi statusline guibg=#333333 guifg=White ctermbg=0 ctermfg=7

" Highlight the text if the length over 81
highlight OverLength ctermbg=darkred guibg=#FFD9D9
autocmd filetype c,cpp match OverLength /\%81v.\+/

" Enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" remove trailling white space
autocmd BufWinLeave * call RemoveTrailingWhitespace()

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" ------------------------ end of auto command --------------------------
