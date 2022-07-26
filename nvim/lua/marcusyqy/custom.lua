-- locals
local Remaps   = require("marcusyqy.keymap")
local nmap     = Remaps.nmap
local nnoremap = Remaps.nnoremap
local inoremap = Remaps.inoremap
local vnoremap = Remaps.vnoremap
local vimfn = Remaps.vimfn

-- removing the weird binding that doesn't let me go forward
inoremap("<s-tab>", "<C-D>")
vnoremap("<tab>", ">gv")
vnoremap("<s-tab>", "<gv")

nnoremap("<s-left>", "<C-w><")
nnoremap("<s-right>", "<C-w>>")
nnoremap("<s-up>", "<C-w>+")
nnoremap("<s-down>", "<C-w>-")
vnoremap("<leader>p", vimfn([["_dp]]))
vnoremap("<leader>P", vimfn([["_dP]]))

nnoremap("<leader>fy", function() vim.cmd([[:let @+=@%<CR>]]) end)

-- make Y behave
nnoremap("Y", "y$")

-- yank to buffer
nnoremap("<leader>y", function() vim.cmd([["+y]]) end)
vnoremap("<leader>y", function() vim.cmd([["+y]]) end)
nmap("<leader>Y", function() vim.cmd([["+Y]]) end)

-- center cursor
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`v")

inoremap("<c-c>", "<esc>")
nnoremap("<leader>sf", ":ClangdSwitchSourceHeader<cr>")

-- undo breakpoints
-- inoremap(",", ",<c-g>u")
-- inoremap(".", ".<c-g>u")
-- inoremap("!", "!<c-g>u")
-- inoremap("?", "?<c-g>u")
-- inoremap("-", "-<c-g>u")
-- inoremap("(", "(<c-g>u")
-- inoremap("[", "[<c-g>u")

nnoremap("<expr> k", function()
    vim.cmd([[
        (v:count > 5 ? "m'" . v:count : "") . 'k'
    ]])
end)
nnoremap("<expr> j", function()
    vim.cmd([[
        (v:count > 5 ? "m'" . v:count : "") . 'j'
    ]])
end)

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- "nice removing of whitespaces!
-- fun! TrimWhiteSpace()
--     let l:save = winsaveview()
--     keeppatterns %s/\s\+$//e
--     call winrestview(l:save)
-- endfun
--
-- augroup AUTO_REMOVE_WHITESPACE_MARCUS
--     autocmd!
--     autocmd BufWritePre * :call TrimWhiteSpace()
-- augroup END
