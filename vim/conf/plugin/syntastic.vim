" ----------------------------------------------------------------
"                           [syntatic]
" ----------------------------------------------------------------
" set mode to 'active' to enable it, 'passive' to disable it
let g:syntastic_mode_map = { 'mode': 'passive', 
                           \ 'active_filetypes': ['ruby', 'php'],
                           \ 'passive_filetypes': ['puppet'] }

let g:syntastic_check_on_open = 1 " check it or not when open files
let g:syntastic_auto_jump     = 0 " auto jump to error or not
