" === STYLE & FORMATTING ===
" Setup font
set guifont=Knack\ Regular\ Nerd\ Font\ Complete:h12
" === STYLE & FORMATTING ===


" === PLUGINS CONFIG ===
" === scrooloose/nerdtree ===
autocmd GUIEnter * NERDTree

" === vim-airline/vim-airline ===
let g:airline_left_sep='▙'
let g:airline_right_sep='▟'
" === PLUGINS CONFIG ===


" === KEY MAPPINGS ===
" MacVim needs explicit insert mode <Nop>'s for arrow keys
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
" === KEY MAPPINGS ===
