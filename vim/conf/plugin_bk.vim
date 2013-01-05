" ----------------------------------------------------------------
"                           [NERDTree]
" ----------------------------------------------------------------
let NERDTreeShowBookmarks=0     "Display the bookmark table.
let NERDTreeQuitOnOpen=0        "Whether to close after opening a file.
let NERDTreeMouseMode=3         "Single click to open any node.
let NERDTreeCaseSensitiveSort=0 "Sort the files case insensitive.
let NERDTreeWinSize = 31        "Default is 31
let NERDTreeDirArrows = 1       "Show arrows
let NERDTreeCasadeOpenSingleChildDir=1

" Ignore the following files
let NERDTreeIgnore  = ['\.o$[[file]]']
let NERDTreeIgnore += ['\.class$[[file]]']
let NERDTreeIgnore += ['^moc_[[file]]', '^ui_[[file]]', '\.ui$[[file]]']
let NERDTreeIgnore += ['\qrc_[[file]]', '\.qrc$[[file]]']
let NERDTreeIgnore += ['\.user[[file]]']
let NERDTreeSortOrder=['\/$', '\.h$','\.c$', '\.cpp$', '*', '\.pro$']
"let NERDTreeIgnore += ['\(\.cpp\)\@<!$[[file]]'] "this will filter all files except .cpp

"Do some key mapings
nmap <leader>wm :NERDTreeToggle<cr> "map the key
