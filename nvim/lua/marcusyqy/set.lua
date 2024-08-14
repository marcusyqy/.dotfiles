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
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

-- vim.opt.laststatus = 3
vim.opt.showmode = true
-- vim.opt.splitkeep = "cursor"

-- vim.opt.cursorline = true -- true

-- display chars for tabs and trailing spaces
-- vim.opt.listchars="eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"
-- vim.opt.list = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.noswapfile = true
-- vim.opt.nobackup = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = vim.fn.expand('~/.vim/undodir/')
vim.opt.wildmode="list:longest,full"
vim.opt.wildignore:append(".git")
vim.opt.wildignorecase = true

vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.inccommand = "split" -- for :substitute - i love it

-- Some servers have issues with backup files, see #649.
vim.g.nowritebackup = true

-- should i remove this to get better mappings of H and L ?
vim.opt.scrolloff = 0 -- 8 -- test this out.
vim.opt.signcolumn = "no" -- change to "yes" to get something weird. and "auto" is really wonky
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
vim.opt.colorcolumn = "" -- "120"

vim.o.background = 'dark'

vim.opt.mouse= ""
vim.opt.cinoptions="l1"

vim.opt.termguicolors = true


-- vim.opt.showbreak='↪'
vim.opt.listchars='tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨'

vim.lsp.set_log_level("off")
