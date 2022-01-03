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


runtime ./gui.vim
let g:autoclose_vim_commentmode = 1
