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
Plugin 'tpope/vim-sensible'                   " Sensible default settings
Plugin 'altercation/vim-colors-solarized'     " Solorazied colour scheme
Plugin 'scrooloose/nerdtree'                  " Project and files explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'          " Git indicators for NERD Tree
Plugin 'tpope/vim-fugitive'                   " Git wrapper
Plugin 'airblade/vim-gitgutter'               " Git diffs in the gutter
Plugin 'ryanoasis/vim-devicons'               " File type icons

" Language/syntax plugins
Plugin 'vim-syntastic/syntastic'              " Syntax checker
Plugin 'mtscout6/syntastic-local-eslint.vim'  " Prefer local eslint over global

" Finish Vundle setup, all plugins must be added before this line
call vundle#end()
filetype plugin indent on
" === VUNDLE ===


" === STYLE & FORMATTING ===
syntax on
set encoding=utf-8
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
" === scrooloose/nerdtree ===
let NERDTreeWinSize=40
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\..*$[[dir]]', 'node_modules$[[dir]]', 'bower_components$[[dir]]', 'public$[[dir]]', 'tmp$[[dir]]', 'dist$[[dir]]']

" === Xuyuanp/nerdtree-git-plugin ===
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }

" === vim-syntastic/syntastic ===
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1 " Populate loc list on errors
let g:syntastic_auto_loc_list=1            " Auto popup loc list on errors
let g:syntastic_check_on_open=1            " Runs checks on open
let g:syntastic_check_on_wq=0              " Disable checks on :wq
let g:syntastic_javascript_checkers=['eslint']

" === ryanoasis/vim-devicons ===
autocmd FileType nerdtree setlocal ambiwidth=double " https://github.com/ryanoasis/vim-devicons/issues/133
let g:WebDevIconsNerdTreeAfterGlyphPadding='' " Reduce space after glyph character
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
