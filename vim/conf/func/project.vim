" [Rebuild the project]
func! Rebuild()
    exec "silent make clean"
    call Build()
endfunc

" [Build the project]
function! Build()
    if filereadable("Makefile")
        exec "make -j4"
    elseif &filetype == 'java'
        exec "!javac %"
    endif
endfunction

" [Generate .pro and Makefile using qmake]
function! Qmake()
    exec "silent !qmake -project; qmake"
    call Build()
endfunction

function! Jmake()
    if !filereadable("Makefile")
        exec "!cp $HOME/.vim/local/conf/makefile_4_java Makefile"
    else
        echo "Makefile already exist"
    endif
endfunction

" [Run the project]
func! RunProject()
    if filereadable("Makefile") 
        if filereadable("input")
            if &filetype == 'c' || &filetype =='cpp'
                exec "!./" . expand(expand("%:p:h:t")). " < input"
            elseif &filetype =='java'
                exec "!java " . expand(expand("%:p:h:t")) . " < input"
            endif
        else
            if &filetype == 'c' || &filetype == 'cpp'
                exec "!./" . expand(expand("%:p:h:t"))
            elseif &filetype == 'java'
                exec "!java " . expand(expand("%:p:h:t")) 
            endif
        endif
    elseif &filetype != 'c' && &filetype != 'cpp' 
        exec "SCCompileRun"
    endif
endfunc

function! Vargrind()
    if filereadable("Makefile") && (&filetype == 'c' || &filetype == 'cpp')
        if filereadable("input")
            exec "!valgrind ./" . expand(expand("%:p:h:t")). " < input"
        else
            exec "!valgrind ./" . expand(expand("%:p:h:t"))
        endif
    endif
endfunction
