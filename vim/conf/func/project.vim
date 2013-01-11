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
