lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

nnoremap <leader>tdc <cmd>TodoTelescope<CR>
nnoremap <leader>tdl TodoQuickFix<CR>
