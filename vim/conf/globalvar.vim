"                       Global Variable Definition:
let g:netrw_home = "/tmp"

" ouput format for dot, you can set it as pdf
let g:WMGraphviz_output = 'ps'

" for clang completion
let g:clang_use_library = 1
let g:clang_library_path = "/usr/lib/llvm" " The path of clang
                                           " different dist will have differnt path

" neocomplcache will overwrite complefunc
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto=1 " add clang_complete option
" -----------------End of Global Variable Definition ---------------
