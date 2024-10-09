vim.cmd([[hi clear]])

vim.g.colors_name='marcus-base16'
require('base16-colorscheme').setup({
     base00 = '#181818', base01 = '#282828', base02 = '#383838', base03 = '#585858',
     base04 = '#b8b8b8', base05 = '#d8d8d8', base06 = '#e8e8e8', base07 = '#f8f8f8',
     base08 = '#ab4642', base09 = '#dc9656', base0A = '#f7ca88', base0B = '#a1b56c',
     base0C = '#86c1b9', base0D = '#7cafc2', base0E = '#ba8baf', base0F = '#a16946'
    })
vim.cmd("hi Normal guibg=None")
vim.cmd("hi NormalNC guibg=None")
vim.cmd("hi LineNr guifg=orange guibg=#222222")
vim.cmd("hi LineNrBelow guifg=white guibg=#222222")
vim.cmd("hi LineNrAbove guifg=white guibg=#222222")
