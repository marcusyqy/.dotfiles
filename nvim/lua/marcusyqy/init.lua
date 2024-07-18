-- init.lua stuff that needs to be done first
require("marcusyqy.settings")

vim.cmd([[
    syntax on
    filetype off "required
    syntax enable
]])

-- set leader before anything else
vim.g.mapleader = " "

-- modules
require("marcusyqy.packer")

-- files
require("marcusyqy.custom")
require("marcusyqy.git")
require("marcusyqy.keymap")
require("marcusyqy.navigation")
require("marcusyqy.set")



-- directories
require("marcusyqy.color")
require("marcusyqy.language")

-- events
local augroup = vim.api.nvim_create_augroup
MarcusYqyGroup = augroup('MarcusYqy', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
--     group = MarcusYqyGroup,
--     pattern = "*.rs",
--     callback = function()
--         require("lsp_extensions").inlay_hints {}
--     end
-- })

-- remove white spaces
autocmd({ "BufWritePre" }, {
    group = MarcusYqyGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})


-- enable formatting of buffer when saving
-- autocmd({ "BufWritePre" }, {
--     group = MarcusYqyGroup,
--     pattern = "*",
--     command = "lua if vim.lsp.buf.server_ready() then vim.lsp.buf.format() end",
-- })

vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle=0
vim.g.netrw_sort_sequence = "[\\/]$,\\~$"

-- fun! EmptyRegisters()
-- let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
-- for r in regs
--     call setreg(r, [])
-- endfor
-- endfun
--
-- vim.api.nvim_command('autocmd VimResized * wincmd =')
