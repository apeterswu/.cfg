" 						General Maping Keys:
" -----------------------------------------------------------------------
" [Copy and cut in visual mode; Paste in insert mode]
inoremap    <c-v>   <c-o>:set paste<cr><c-r>+<c-o>:set nopaste<cr>
xnoremap    <c-c>   "+y
xnoremap    <c-x>   "+x

" [Select all]
nnoremap    <c-a>   ggVG

" [Scroll up and down in Quickfix]
nnoremap    <c-n>   :cn<cr>
nnoremap    <c-p>   :cp<cr>

" [Basically you press * or # to search for the current selection !! Really useful]
vnoremap    <silent> *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap    <silent> #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" [CTRL-hjkl to browse command history and move the cursor]
cnoremap    <c-k>   <up>
cnoremap    <c-j>   <down>
cnoremap    <c-h>   <left>
cnoremap    <c-l>   <right>

" [Easy indent in visual mode]
xnoremap    <   <gv
xnoremap    >   >gv

" [Search and Complete]
"cnoremap    <m-n>   <cr>/<c-r>=histget('/',-1)<cr>
cnoremap    <m-i>   <c-r>=tolower(substitute(getline('.')[(col('.')-1):],'\W.*','','g'))<cr>

" [Quick write and quit]
nnoremap    <leader>, :wa!<cr>
nnoremap    <leader>ww   :wqa!<cr>
nnoremap    <leader>qq   :qa!<cr>

" [Diff mode maps]
nnoremap    du      :diffupdate<cr>
xnoremap    <m-o>   :diffget<cr>
xnoremap    <m-p>   :diffput<cr>

" [Up down move]
nnoremap    j       gj
nnoremap    k       gk
nnoremap    gj      j
nnoremap    gk      k

" [Misc]
nnoremap    J       gJ
nnoremap    gJ      J
nnoremap    -       _
nnoremap    _       -

" [Smart way to move btw. windows]
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" [Use the arrows to switch between buffers]
nmap <tab> :bn<cr>
nmap <S-tab> :bp<cr>

" no Highlight search"
nmap <leader><cr> :nohlsearch<cr>

" [switch to the directory of the open buffer]
map <leader>cd :cd %:p:h<cr>

" [complete close curly brace]
inoremap {<cr> {<cr>}<c-[>ko

" [Build the project]
nmap <S-M> :call Build()<cr>
"nmap <C-S-M> :call Rebuild()<cr>

" [Run the project]
nmap <S-R> :call RunProject()<cr>
nmap <C-F5> : call RunProject()<cr>

" [Spell checking]"
map <leader>se :setlocal spell spelllang=en_us<cr>
map <leader>sn :setlocal nospell<cr>

"<F5><F6><F7><F8><F10> are unused"
"--------------------- end of general key mapings ------------------------
