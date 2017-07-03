set nocompatible " Vim not vi, must be first!

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
Plugin 'tpope/vim-markdown'                   " Better markdown support (fenced code blocks)
Plugin 'ElmCast/elm-vim'                      " Better elm support
Plugin 'ap/vim-css-color'                     " Colours highlighter

" Finish Vundle setup, all plugins must be added before this line
call vundle#end()
filetype plugin indent on
" === VUNDLE SETUP ===


" === GENERAL CONFIG ===
" Reference: http://vimdoc.sourceforge.net/htmldoc/options.html
" Some sensible defaults set by vim-sensible (https://github.com/tpope/vim-sensible)
" autoindent, backspace, ttimeout, incsearch, laststatus, ruler, wildmenu, history
set ttyfast                     " Send more characters at a time
set mouse=a                     " Enable mouse in all modes
set clipboard=unnamed           " Use the OS clipboard by default
set nostartofline               " Prevent some commands moving cursor to start of line

" === Text and editing ===
set encoding=utf-8              " Use utf-8 for character encoding
set spelllang=en_au,en_gb,en_au " Spell checking languages
set expandtab                   " Use spaces instead of tabs
set tabstop=2                   " 2 spaces for hard tabs
set softtabstop=2               " 2 spaces for soft tabs
set shiftwidth=2                " 2 spaces for indents
set shiftround                  " Round indents to multiples of 'shiftwidth'
set smartindent                 " Smart autoindenting when starting a new line
set ignorecase                  " Ignore case in search patterns
set smartcase                   " Obey case if search pattern contains uppercase
set iskeyword+=-,_,$,@,%,#,?    " These are not word dividers
" Disable continuing comments on new lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" === Appearance ===
syntax on                       " Enable syntax highlighting
colorscheme solarized           " Set colour scheme (solarized all the things!)
set background=dark             " Use dark colour scheme variant
set showcmd                     " Show (partial) command while typing
set lazyredraw                  " Don't redraw when we don't have to
set hlsearch                    " Highlight all search matches
set visualbell                  " Use visual bell instead of beeping
set showbreak=↪\                " Character to display at the start of soft-wrapped lines
set scrolloff=3                 " Minimum lines to show above/below cursor
set sidescrolloff=3             " Minimum characters to show beside cursor

" === Files and buffers ===
silent !mkdir -p $HOME/.vim/undo > /dev/null 2>&1
set undodir=~/.vim/undo         " Directory to save undo files
set undofile                    " Persist undo history to a file
set undolevels=1000             " Maximum number of changes that can be undone
set noswapfile                  " Don't create swap files
set nobackup                    " Don't make a backup before overwriting a file
set nowritebackup               " Don't make a backup before writing a file
set hidden                      " Allow buffers to exist in the background
set autoread                    " Re-read open files when changed outside Vim
" File patterns to ignore when expanding wildcards
set wildignore+=.DS_Store
set wildignore+=*/.git/*
set wildignore+=*/.sass-cache/*
set wildignore+=*/node_modules/*,*/bower_components/*,*/elm-stuff/*
set wildignore+=*/log/*,*/tmp/*,*/build/*,*/dist/*,*/doc/*,*/vendor/*
set wildignore+=*.gif,*.jpeg,*.jpg,*.png,*.psd

" === File types ===
set omnifunc=syntaxcomplete#Complete

augroup filetype_detect
  autocmd FileType text setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 spell
  autocmd FileType markdown setlocal iskeyword-=/ wrap linebreak nolist textwidth=0 wrapmargin=0 spell

  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,xml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd Filetype elm setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
augroup END
" === GENERAL CONFIG ===


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

" === ctrlpvim/ctrlp.vim ===
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command='rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching=0
endif

" === vim-airline/vim-airline ===
let g:airline_theme='solarized'             " Solarized colour scheme
let g:airline_powerline_fonts=1             " Use powerline fonts
let g:airline_skip_empty_sections=1         " Don't show empty sections
let g:airline_left_sep=''                   " Don't use separators in terminal
let g:airline_right_sep=''                  " ...

" === ryanoasis/vim-devicons ===
autocmd FileType nerdtree setlocal ambiwidth=double " https://github.com/ryanoasis/vim-devicons/issues/133
let g:WebDevIconsNerdTreeAfterGlyphPadding=''       " Reduce space after glyph character

" === vim-syntastic/syntastic ===
let g:syntastic_always_populate_loc_list=1  " Populate loc list on errors
let g:syntastic_auto_loc_list=1             " Auto popup loc list on errors
let g:syntastic_check_on_open=1             " Runs checks on open
let g:syntastic_check_on_wq=0               " Disable checks on :wq
let g:syntastic_loc_list_height=5           " Set max height on loc list
let g:syntastic_error_symbol=''            " Override syntastic error symbol
let g:syntastic_warning_symbol=''          " Override syntastic warning symbol
let g:syntastic_javascript_checkers=['eslint']
let g:elm_syntastic_show_warnings=1

" === sheerun/vim-polyglot ===
let g:polyglot_disabled=['elm', 'markdown'] " Disable some vim-polyglot languages

" === ElmCast/elm-vim ===
let g:elm_format_autosave=1                 " Run elm-format on save

" === tpope/vim-markdown ===
let g:markdown_fenced_languages=['javascript', 'js=javascript', 'json', 'css', 'sass', 'scss', 'html', 'xml', 'elm']
" === PLUGINS CONFIG ===


" === KEY MAPPINGS ===
let mapleader=','

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
