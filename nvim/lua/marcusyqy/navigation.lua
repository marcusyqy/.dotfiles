-- locals
local Remaps   = require("marcusyqy.keymap")
local nnoremap = Remaps.nnoremap

nnoremap("<c-j>", ":cnext<CR>zz")
nnoremap("<c-k>", ":cprev<CR>zz")
-- nnoremap("<c-l>", ":cexpr []<CR>")
nnoremap("gj", ":lnext<CR>zz")
nnoremap("gk", ":lprev<CR>zz")

local marcusyqy_qf_l = 0
local marcusyqy_qf_g = 0

local ToggleQFList = function(globs)
    if globs then
        if marcusyqy_qf_g == 1 then
            marcusyqy_qf_g = 0
            vim.cmd("cclose")
        else
            marcusyqy_qf_g = 1
            vim.cmd("copen")
        end
    else
        if marcusyqy_qf_l == 1 then
            marcusyqy_qf_l = 0
            vim.cmd("lclose")
        else
            marcusyqy_qf_l = 1
            vim.cmd("lopen")
        end
    end
end

nnoremap("<C-q>", function() ToggleQFList(true) end)
nnoremap("<leader>q", function() ToggleQFList(false) end)

vim.cmd("cnoreabbrev ClearQuickfixList cexpr []")
vim.cmd("cnoreabbrev cqfl cexpr []")

