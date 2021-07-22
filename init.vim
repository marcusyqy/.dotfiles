"init vim here

"autocmd!
syntax on

filetype off "required
syntax enable

" run sets vim scripts
runtime ./sets.vim

" load plugins
runtime ./plug.vim

let mapleader = " "

let g:lsp_cxx_hl_use_text_props = 1

runtime ./colors.vim
runtime ./cycle.vim

runtime ./lazygit.vim
runtime ./custom.vim


runtime ./git.vim

