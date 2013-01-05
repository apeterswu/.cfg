"                       Function Definiton:
"-------------------------------------------------------------------"
" Highlight the status line
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=#333333 ctermfg=6 guifg=Cyan ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

" [Rebuild the project]
func! Rebuild()
    exec "silent make clean"
    call Build()
endfunc

" [Build the project]
function! Build()
    if filereadable("Makefile")
        exec "make -j4"
    else
        exec "SCCompile"
    endif
endfunction

" [Generate .pro and Makefile using qmake]
function! Qmake()
    exec "silent !qmake -project; qmake"
    call Build()
endfunction

" [Run the project]
func! RunProject()
    if filereadable("Makefile")
        if filereadable("input")
            exec "!./" . expand(expand("%:p:h:t")). " < input"
        else
            exec "!./" . expand(expand("%:p:h:t"))
        endif
    else
        exec "SCCompileRun"
    endif
endfunc

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

function! Debug()
    let l:bin_name = expand(expand("%:p:h:t"))
    let g:pyclewn_args = "--gdb=async"
    exec "Pyclewn"
    exec "Cfile " . l:bin_name
    exec "set syntax=gdb"
    exec "Cmapkeys"
    exec "C tbreak main"

    if filereadable("input")
        exec "C run < input"
    else
        exec "C run"
    endif
endfunction
"-------------------------End of Function Definition--------------------"
