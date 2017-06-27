" === STYLE & FORMATTING ===
" Setup font
set linespace=2
set macligatures
set guifont=Fira\ Code:h12
" === STYLE & FORMATTING ===


" === PLUGINS CONFIG ===
" === netrw ===
" automatically open netrw
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
" === PLUGINS CONFIG ===
