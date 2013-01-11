function! PyClewnInit()
    C tbreak main
    Cmapkeys
    set syntax=gdb
    unmap <CR>
endfunction

function! PyClewnPre()
    map <CR> :call PyClewnInit()<CR>
    0put ='Press <Enter> to start'
    setlocal buftype=nofile
endfunction

