
"" set values here
"set exrc

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set guicursor=

"set nocompatible "be iMproved
set hidden
set rnu
set nu
" set nowrap
set cursorline
set noerrorbells
set smarttab
set scrolloff=8
set nohlsearch

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set tabstop=4
set softtabstop =4
set smartindent
set shiftwidth =4
"set list
set nolist
set ignorecase
set expandtab
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set expandtab

" Some servers have issues with backup files, see #649.
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" if you want to have 80 line limit
"set colorcolumn=80


set termguicolors

"use system clip board
set clipboard+=unnamedplus
"for vsvim
" set clipboard=unnamed

set ai "Auto indent
set si "Smart indent

set mouse=a
