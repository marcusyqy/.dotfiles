-- locals
local Remaps   = require("marcusyqy.keymap")
local nmap     = Remaps.nmap
local nnoremap = Remaps.nnoremap
local inoremap = Remaps.inoremap
local vnoremap = Remaps.vnoremap
local vimfn    = Remaps.vimfn

-- planck keymaps
nnoremap("<pageup>", "<c-u>")
vnoremap("<pageup>", "<c-u>")

nnoremap("<pagedown>", "<c-d>")
vnoremap("<pagedown>", "<c-d>")

-- removing the weird binding that doesn't let me go forward
inoremap("<s-tab>", "<C-D>")
vnoremap("<tab>", ">gv")
vnoremap("<s-tab>", "<gv")

vnoremap(">", ">gv")
vnoremap("<", "<gv")

nnoremap("<s-left>", "<C-w><")
nnoremap("<s-right>", "<C-w>>")
nnoremap("<s-up>", "<C-w>+")
nnoremap("<s-down>", "<C-w>-")
vnoremap("<leader>p", "\"_dp")
vnoremap("<leader>P", "\"_dP")

-- nnoremap("<leader>fy", ":let @+=@%<cr>")
nnoremap("<leader>fy", vimfn([[let @+=@%]]))

-- make Y behave
nnoremap("Y", "y$")

-- yank to buffer
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

-- center cursor
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`v")

inoremap("<c-c>", "<esc>")
nnoremap("<leader>sf", vimfn([[ClangdSwitchSourceHeader]]))

-- undo breakpoints
-- inoremap(",", ",<c-g>u")
-- inoremap(".", ".<c-g>u")
-- inoremap("!", "!<c-g>u")
-- inoremap("?", "?<c-g>u")
-- inoremap("-", "-<c-g>u")
-- inoremap("(", "(<c-g>u")
-- inoremap("[", "[<c-g>u")

nnoremap("<expr> k", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'")
nnoremap("<expr> j", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'")

vnoremap("J", ":m '>+1<CR>gv=gv", { silent = true })
vnoremap("K", ":m '<-2<CR>gv=gv", { silent = true })

vnoremap("<leader>p", "\"_dp")
nnoremap("<c-h>", "gT")
nnoremap("<c-l>", "gt")

nnoremap("<leader>sv", vimfn([[source $MYVIMRC]]))

-- local function netrw()
--     if vim.bo.filetype == "netrw" then
--         vim.cmd([[Rex]])
--     else
--         vim.cmd([[Ex]])
--     end
-- end

-- nnoremap("<c-b>", netrw)


-- nnoremap("<c-n>", vimfn([[let @/=expand("%:t") \| execute 'Explore' expand("%:h") \| normal n]]))
-- map <Leader>f :<CR>

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
--

-- NOTE:
-- clear quickfix list cxexpr []
-- clear local quickfix list lxexpr []


-- clipboard tryout
nnoremap("p", "\"+p");
vnoremap("p", "\"+p");

nnoremap("y", "\"+y");
vnoremap("y", "\"+y");

