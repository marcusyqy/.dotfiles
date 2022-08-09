vim.opt.winblend=0
vim.opt.wildoptions="pum"
vim.opt.pumblend=5

local colorscheme = "tokyonight"
require("marcusyqy.color." .. colorscheme)

local M = {}
M.colorscheme = colorscheme
return M
