"                           Options:
"-------------------------------------------------------------------
set nocompatible
let mapleader = ","
let g:mapleader = ","
filetype plugin on       		" Enable filetype plugin
filetype indent on
syntax on               		" Enable syntax hl
filetype on
set ambiwidth=double
language message en_US.UTF-8
set autoread                	" Auto read when a file is changed from the outside
set noerrorbells                " No sound on errors
set novisualbell                " No sound on errors
set mouse=a                 	" Enable mouse
set backspace=eol,start,indent 	" Set backspace config
set history=70              	" The lines of history VIM has to remember
set completeopt=menu,menuone,longest
set complete-=i					" Not to include headers?
set fillchars=vert:\|,fold:-
set formatoptions+=rnmMw
set guioptions+=eg
set guioptions-=l               " No left-hand scrollbar
set guioptions-=L               " No left-hand scrollbar always
set guioptions-=r               " No right-hand scrollbar
set guioptions-=R               " No right-hand scrollbar always
set guioptions-=b               " No bottom scrollbar
set guioptions-=m               " No menubar
set guioptions-=T               " No toolbar(T)
set guioptions-=t               " Not include tearoff menu items.
set linespace=1
set nobackup                	" Don't back up file.
set undolevels=500
set updatetime=500				" Similar to auto save.
set virtualedit=block
set wildmenu					" Command line completion is enhanced.
set winaltkeys=no				" Disable ALT key for the GVIM application.
set hidden          	        "Make the buffer hidden, instead of unload
set whichwrap+=<,>,[,]			"Move the cursor to next or previous line.
set noswapfile
set textwidth=75

" [Search configuration]
set ignorecase          		" Ignore case when searching
set smartcase           		" Case matches depend on what you type
set incsearch           		" Make search act like search in modern browsers
set magic               		" Use regular expressions for searching

" [Tab configuration]
set shiftwidth  =4              " Number of space for indenting
set tabstop     =4              " Width of TAB
set softtabstop =4
set expandtab                   " Insert space for TAB
set smarttab

" [spell checking]
set nospell						" No spell checking.
set spelllang=en  				" Language for spell checking.

" [Display configuration]
set splitright					" Put new splited window to the right of current.
set number              		" Display line number
set display=lastline,uhex
set ruler                		" Always show current position
set cmdheight=2          		" The commandbar height
set scrolloff=999               " min # of line above and below cursor
set showcmd              		" Show the command currently executing.
set showmode             		" Show which mode you are in
set showmatch            		" Show matching bracets when text indicator is over them
set nolazyredraw         		" Don't redraw while executing macros
set linebreak
set wrap						" Wrap the text
set t_Co=256
set hlsearch                    " highlight search
colorscheme wombat256mod

" [Statusline]
set laststatus=2 				" Always show the statusline
set statusline=
set statusline+=[%n]\                            "buffer number
set statusline+=%<%f\                            "File+path
set statusline+=%=%{strftime('%I:%M')}\ \        "Current time
set statusline+=%y\ \                            "FileType
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}  "Encoding
set statusline+=%{(&bomb?\",BOM\":\"\")}/        "Encoding2
set statusline+=%{&ff}\                          "FileFormat (dos/unix..)
set statusline+=\ row:%l/%L\ \                   "Rownumber/total (%)
set statusline+=col:%03c\                        "Colnr
set statusline+=\ %m%r%w\ %P\ \                  "Modified? Readonly? Top/bot.

" [Indent configuration]
set autoindent
set cindent

" [diff options]
set diffopt=filler,vertical

" [platform specific options]
if has("win32")
    set encoding=utf-8
    set fileencodings=ucs-bom,cp936,gb18030,utf-8,big5,iso-8859-1
    set fileformats=dos
elseif has("unix")
    set encoding=utf-8
    setglobal fenc=utf-8
    set termencoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,iso-8859-1
    set fileformats=unix,dos,mac
else
    set encoding=utf-8
endif
"-----------------------  End of Options ---------------------------
