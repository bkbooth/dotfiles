" === GENERAL SETTINGS ===
" Reference: http://vimdoc.sourceforge.net/htmldoc/options.html
" Some sensible defaults set by vim-sensible (https://github.com/tpope/vim-sensible)
" Use Vim settings rather then Vi settings. Must be first!
set nocompatible
" Show (partial) command in the last line of the screen
set showcmd
" When there is a previous search pattern, highlight all its matches
set hlsearch
" Copy indent from current line when starting a new line
set autoindent
" Map , as leader
let mapleader=","
" === GENERAL SETTINGS ===


" === VUNDLE ===
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Various plugins
Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'

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
