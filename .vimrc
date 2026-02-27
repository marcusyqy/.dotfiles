syntax on

let mapleader=" "
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set si
set number
set hlsearch
set ruler
set undodir=$HOME/.vim/undodir/
set dir=$HOME/.vim/tmp/
set background=dark
set rnu
set nu
set incsearch
nnoremap <leader>y "+y$
vnoremap <leader>y "+y
vnoremap <leader>p "+P
highlight Comment guifg=red ctermfg=red
highlight Normal guifg=white guibg=#1d1d1d ctermbg=black ctermfg=white
