" The file will be only loaded running gvim
" It is used just as a pointer to point to the specific configuration 

if has("win32")
    call SourceScript(g:conf_path_win32 . 'gui-win32.vim')
else
    call SourceScript(g:conf_path_unix . 'gui-unix.vim')
endif
