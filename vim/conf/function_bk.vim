" [using google-chrome to open the current file in html format]
function! HtmlOpen()
    set nonumber
    TOhtml
    let s:command='!google-chrome ' . "\'" . expand(expand("%:p")) . "\'"
    exec s:command
endfunction

" [Make tags for C/C++ or Java]
function! MakeTags()
    if &filetype == 'java'
        exec ':silent '."!ctags --field=+ilaS -R --language-force=java ."
    elseif &filetype == 'c'
        exec ':silent '."!ctags -R --fields=+laS --c-kinds=-p --extra=q ."
    elseif &filetype == 'cpp'
        exec ':silent '."!ctags -R --fields=+ialS --c-kinds=-p --c++-kinds=-p --extra=q ."
    endif
endfunction

" [Remake tags for C/C++ or Java]
function! RemakeTags()
    exec ':silent '."!rm -f tags"
    call MakeTags()
endfunction

" [Update Last modified time stamp]
function! LastModified()
    if &modified
        let save_cursor = getpos(".")
        let n = min([30, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}Last Modified: \).*#\1' .
                    \ strftime('%c') . '#e'
        "keepjumps exe '1,' . n . 's#^\(.\{,10}@date \).*#\1' .
                    "\ strftime('%c') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun

" [Highlight column matching { } pattern]
let s:hlflag=0
function! ColumnHighlight()
    let c=getline(line('.'))[col('.') - 1]
    if c=='{' || c=='}'
        let &cc = s:cc_default . ',' . virtcol('.')
        let s:hlflag = 1
    else
        if s:hlflag == 1
            let &cc = s:cc_default
            let s:hlflag = 0
        endif
    endif
endfunction

" [Let the same line combine together]
function! UniqueLine() range
    let l1 = a:firstline
    let l2 = a:lastline
    while l1<=l2
        call cursor(l1,1)
        let lineCount=0
        let lineData=getline(l1)
        if lineData==''
            execute l1." d"
            let l2-=1
        else
            let lineDataEsc=escape(lineData,'\\/.*$^~[]')
            while search('^'.lineDataEsc.'$','c',l2)>0
                execute "d"
                let l2-=1
                let lineCount+=1
            endwhile
            let lineData=lineCount."\t".lineData
            call append(l1-1,[lineData])
            let l2+=1
            let l1+=1
        endif
    endwhile
endfunction

" [Java setup]
function! SetupJava()
    "set up Make for java
    autocmd BufRead *.java set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
    autocmd BufRead *.java set makeprg=ant\ compile\ -find\ ../build.xml
endfunction
