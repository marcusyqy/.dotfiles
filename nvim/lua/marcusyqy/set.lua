-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
-- vim.opt.guicursor = ""

-- set nocompatible "be iMproved
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = true
vim.opt.hlsearch = require("marcusyqy.utils.hlsearch").hlsearch -- uses some config
vim.opt.ruler = true

vim.opt.errorbells = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.laststatus = 1
vim.opt.showmode = true
vim.opt.splitkeep = "cursor"

vim.opt.cursorline = false -- true
-- Configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- display chars for tabs and trailing spaces
vim.opt.listchars="eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"
vim.opt.list = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.noswapfile = true
-- vim.opt.nobackup = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = vim.fn.expand('~/.vim/undodir/')
vim.opt.wildignorecase = true

-- if vim.fn.has("win32") ==1 then
--     vim.cmd([[set undodir="~/.vim/undodir"]])
-- else
--     vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- end
-- vim.opt.undodir = "~/.vim/undodir"

vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.inccommand = "split" -- for :substitute - i love it

-- Some servers have issues with backup files, see #649.
vim.g.nowritebackup = true

-- should i remove this to get better mappings of H and L ?
vim.opt.scrolloff = 0 -- 8 -- test this out.
vim.opt.signcolumn = "no" -- change to "yes" to get something weird. and "auto" is really wonky
-- vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
vim.opt.colorcolumn = "120"
--
-- set ai "Auto indent
-- set si "Smart indent
vim.o.background = 'dark'

vim.opt.mouse= ""
vim.opt.cinoptions="l1"

vim.opt.termguicolors = true

