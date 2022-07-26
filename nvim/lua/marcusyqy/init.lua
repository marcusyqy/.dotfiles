-- must be first
require("marcusyqy.packer")

-- files
require("marcusyqy.color")
require("marcusyqy.custom")
require("marcusyqy.git")
require("marcusyqy.keymap")
require("marcusyqy.navigation")
require("marcusyqy.sets")

-- directories
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

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = MarcusYqyGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

-- remove white spaces
autocmd({"BufWritePre"}, {
    group = MarcusYqyGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- fun! EmptyRegisters()
-- let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
-- for r in regs
--     call setreg(r, [])
-- endfor
-- endfun
