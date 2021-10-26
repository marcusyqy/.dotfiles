"init vim here

"autocmd!
syntax on


let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"
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
runtime ./navigation.vim

lua << EOF
local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = false,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil
}

require('auto-session').setup(opts)
EOF

set guifont=Hack\ NF:h16
let g:neovide_refresh_rate=140
let g:neovide_transparency=0.95
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

