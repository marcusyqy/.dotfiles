-- no
vim.g.python_recommended_style = 0

vim.cmd([[
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    nnoremap <Leader>a :Ack!<Space>
endif
]])

require("marcusyqy")

