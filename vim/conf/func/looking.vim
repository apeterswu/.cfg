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
