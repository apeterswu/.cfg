" [convert file format from dos to unix]
func! Dos2Unix()
    exec "update"
    exec "e ++ff=dos"
    exec "setlocal ff=unix"
    exec "w"
endfunc

" [convert file format from unix to dos]
func! Unix2Dos()
    exec "update"
    exec "e ++ff=dos"
    exec "w"
endfunc

" Remove trailing whitespace when writing a buffer, but not for diff files.
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction


