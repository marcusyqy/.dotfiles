"init vim here

"autocmd!
syntax on

filetype off "required
syntax enable

" load plugins
runtime ./plug.vim


" run sets vim scripts
runtime ./sets.vim

lua require("marcusyqy.language")
lua require("marcusyqy.color")

" runtime ./custom.vim
lua require("marcusyqy.custom")

lua require("marcusyqy.git")
lua require("marcusyqy.navigation")

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

fun! EmptyRegisters()
let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
for r in regs
    call setreg(r, [])
endfor
endfun
