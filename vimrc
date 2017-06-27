" === GENERAL SETTINGS ===
" Reference: http://vimdoc.sourceforge.net/htmldoc/options.html
" Some sensible defaults set by vim-sensible (https://github.com/tpope/vim-sensible)
set nocompatible  " Use Vim settings rather then Vi settings. Must be first!
set showcmd       " Show (partial) command in the last line of the screen
set showmode      " If in Insert, Replace or Visual mode put a message on the last line
set hlsearch      " When there is a previous search pattern, highlight all its matches
set autoindent    " Copy indent from current line when starting a new line
set hidden        " Allow background buffers
set visualbell    " Use visual bell instead of beeping
set noswapfile    " Disable swapfiles
set nobackup      " ...
set nowb          " ...
let mapleader="," " Map , as leader
" === GENERAL SETTINGS ===


" === VUNDLE ===
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Various plugins
Plugin 'tpope/vim-sensible'               " Sensible default settings
Plugin 'altercation/vim-colors-solarized' " Solorazied colour scheme

" Language/syntax plugins

" Finish Vundle setup, all plugins must be added before this line
call vundle#end()
filetype plugin indent on
" === VUNDLE ===


" === STYLE & FORMATTING ===
syntax on
set background=dark
colorscheme solarized

" Use the appropriate number of spaces to insert a tab
set expandtab
" Default to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
" === STYLE & FORMATTING ===


" === PLUGINS CONFIG ===
" === netrw ===
let g:netrw_banner=0       " Suppress the banner
let g:netrw_liststyle=3    " Tree style listing
let g:netrw_browse_split=4 " Open files in previous window
let g:netrw_altv=1         " Use right-splitting instead of left-splitting
let g:netrw_winsize=25     " Use 25% of buffer width for netrw window
" === PLUGINS CONFIG ===


" === KEY MAPPINGS ===
" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :
" Select block
nnoremap <leader>v v%
" Escape visual mode easily
inoremap jk <Esc>
" Temporarily disable search highlight
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Easier window moving and resizing
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>h :vertical resize -1<CR>
nnoremap <Leader>l :vertical resize +1<CR>
nnoremap <Leader>j :resize +1<CR>
nnoremap <Leader>k :resize -1<CR>
" === KEY MAPPINGS ===
