" === STYLE & FORMATTING ===
" Setup font
set linespace=2
set guifont=HackNerdFontComplete-Regular:h12
" === STYLE & FORMATTING ===


" === PLUGINS CONFIG ===
" === scrooloose/nerdtree ===
autocmd GUIEnter * NERDTree

" === vim-airline/vim-airline ===
let g:airline_left_sep="\uE0C0"
let g:airline_right_sep="\uE0C2"
" === PLUGINS CONFIG ===


" === KEY MAPPINGS ===
" MacVim needs explicit insert mode <Nop>'s for arrow keys
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
" === KEY MAPPINGS ===
