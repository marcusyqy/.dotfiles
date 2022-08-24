
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- vim.opt.guicursor = ""

-- set nocompatible "be iMproved
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.wrap = false
vim.opt.hlsearch = require("marcusyqy.utils.hlsearch").hlsearch -- uses some config

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

-- display chars for tabs and trailing spaces
vim.opt.listchars="eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"
vim.opt.list = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.noswapfile = true
-- vim.opt.nobackup = true
vim.opt.swapfile = false
vim.opt.backup = false

if vim.fn.has("win32") ==1 then
    vim.cmd([[set undodir="~/.vim/undodir"]])
else
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

-- vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true


-- Some servers have issues with backup files, see #649.
vim.g.nowritebackup = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
-- vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
--
-- set ai "Auto indent
-- set si "Smart indent

vim.opt.mouse="a"

