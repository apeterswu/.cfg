"                           Auto Commands:
" ----------------------------------------------------------------

" switch color between insert mode and normal mode
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=#333333 guifg=White ctermbg=0 ctermfg=7

" Highlight the text if the length over 81
highlight OverLength ctermbg=darkred guibg=#FFD9D9
autocmd filetype c,cpp match OverLength /\%81v.\+/

" remove trailling white space
autocmd BufWinLeave * call RemoveTrailingWhitespace()

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" ------------------------ end of auto command --------------------------
