-- locals
local Remaps   = require("marcusyqy.keymap")
local nnoremap = Remaps.nnoremap

nnoremap("gj", ":cnext<CR>zz")
nnoremap("gk", ":cprev<CR>zz")
nnoremap("<leader>gj", ":lnext<CR>zz")
nnoremap("<leader>gk", ":lprev<CR>zz")
nnoremap("<c-j>", ":lnext<CR>zz")
nnoremap("<c-k>", ":lprev<CR>zz")

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

