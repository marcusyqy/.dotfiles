
set nocompatible "be iMproved
filetype off "required

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
""lsp stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"Set git respos
Plug 'tpope/vim-fugitive'

"For file explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"TODO(MARCUS) needs to set for neovide - Guifont
"Actually works for Neovide - not sure why;
"CaskaydiaCove Nerd Font Book needed (need nerd font pack to be set on
"terminal)
Plug 'ryanoasis/vim-devicons'
"give squeegly lines
Plug 'airblade/vim-gitgutter'

"ctrl-p to find path files
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'christoomey/vim-tmux-navigator'

"Color theme install
"Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'

" Initialize plugin system
call plug#end()

"theme - here
colorscheme gruvbox
highlight Normal guibg=none

filetype plugin indent on " required
syntax on
set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey
set background=light

set updatetime=300
set number
"set relative number
set rnu
set nowrap
set smartcase
set ignorecase
"set hlsearch
set noerrorbells
set tabstop=4
set softtabstop =4
set expandtab
set smartindent
set shiftwidth =4
set cursorline
set hls is

set exrc
set guicursor=
set noswapfile
set undodir =
set undofile
set incsearch
set termguicolors

"set cursor to be 8 off from the bottom/top
set scrolloff=8
set nohlsearch
set hidden
set signcolumn=yes

let mapleader = " "
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" " Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"set ctrl-n to file dir
nnoremap<silent> <C-n> :NERDTreeFocus<cr>
"nice removing of whitespaces!
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MARCUS_KEYBINDS
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END






