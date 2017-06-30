set nocompatible " Use Vim settings rather then Vi settings. Must be first!

" === VUNDLE SETUP ===
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" === UI and feature plugins ===
Plugin 'tpope/vim-sensible'                   " Sensible default settings
Plugin 'altercation/vim-colors-solarized'     " Solarized colour scheme
Plugin 'scrooloose/nerdtree'                  " Project and files explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'          " Git indicators for NERD Tree
Plugin 'vim-airline/vim-airline'              " Powerful statusline
Plugin 'vim-airline/vim-airline-themes'       " Themes for vim-airline
Plugin 'ctrlpvim/ctrlp.vim'                   " Full path fuzzy finder
Plugin 'tpope/vim-fugitive'                   " Git wrapper
Plugin 'tpope/vim-rhubarb'                    " GitHub wrapper for fugitive
Plugin 'airblade/vim-gitgutter'               " Git diffs in the gutter
Plugin 'ryanoasis/vim-devicons'               " File type icons

" === Text editing plugins ===
Plugin 'tpope/vim-repeat'                     " Make '.' repeats work with mapped commands
Plugin 'tpope/vim-eunuch'                     " Vim sugar for common unix shell commands
Plugin 'tpope/vim-surround'                   " Easily add/change/delete surrounds
Plugin 'tpope/vim-abolish'                    " Shortcuts for quick case-change (plus loads more!)
Plugin 'tpope/vim-commentary'                 " Commenting utils
Plugin 'Raimondi/delimitMate'                 " Insert mode autocomplete for quotes, brackets, etc.
Plugin 'vim-scripts/DeleteTrailingWhitespace' " Delete unwanted whitespace

" === Language/syntax plugins ===
Plugin 'vim-syntastic/syntastic'              " Syntax checker
Plugin 'editorconfig/editorconfig-vim'        " Respect .editorconfig files
Plugin 'sheerun/vim-polyglot'                 " Solid language pack (https://github.com/sheerun/vim-polyglot#language-packs)
Plugin 'ap/vim-css-color'                     " Colours highlighter

" Finish Vundle setup, all plugins must be added before this line
call vundle#end()
filetype plugin indent on
" === VUNDLE SETUP ===


" === GENERAL SETTINGS ===
" Reference: http://vimdoc.sourceforge.net/htmldoc/options.html
" Some sensible defaults set by vim-sensible (https://github.com/tpope/vim-sensible)
set hlsearch      " When there is a previous search pattern, highlight all its matches
set autoindent    " Copy indent from current line when starting a new line
set hidden        " Allow background buffers
set visualbell    " Use visual bell instead of beeping
set noswapfile    " Disable swapfiles
set nobackup      " ...
set nowb          " ...
set laststatus=2  " Always show statusline (airline)
let mapleader=',' " Map , as leader
" === GENERAL SETTINGS ===


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
	\ 'Modified'  : '',
	\ 'Staged'    : '',
	\ 'Untracked' : '',
	\ 'Renamed'   : '',
	\ 'Unmerged'  : '',
	\ 'Deleted'   : '',
	\ 'Dirty'     : '',
	\ 'Clean'     : '',
	\ 'Ignored'   : '',
	\ 'Unknown'   : ''
	\ }

" === vim-syntastic/syntastic ===
let g:syntastic_always_populate_loc_list=1  " Populate loc list on errors
let g:syntastic_auto_loc_list=1             " Auto popup loc list on errors
let g:syntastic_check_on_open=1             " Runs checks on open
let g:syntastic_check_on_wq=0               " Disable checks on :wq
let g:syntastic_loc_list_height=5           " Set max height on loc list
let g:syntastic_error_symbol=''            " Override syntastic error symbol
let g:syntastic_warning_symbol=''          " Override syntastic warning symbol
let g:syntastic_javascript_checkers=['eslint']

" === vim-airline/vim-airline ===
let g:airline_theme='solarized'             " Solarized colour scheme
let g:airline_powerline_fonts=1             " Use powerline fonts
let g:airline_skip_empty_sections=1         " Don't show empty sections
let g:airline_left_sep=''                   " Don't use separators in terminal
let g:airline_right_sep=''                  " ...

" === ryanoasis/vim-devicons ===
autocmd FileType nerdtree setlocal ambiwidth=double " https://github.com/ryanoasis/vim-devicons/issues/133
let g:WebDevIconsNerdTreeAfterGlyphPadding=''       " Reduce space after glyph character
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
