-- locals
local Remaps   = require("marcusyqy.keymap")
local runner   = require("marcusyqy.runner")
local nmap     = Remaps.nmap
local nnoremap = Remaps.nnoremap
local inoremap = Remaps.inoremap
local vnoremap = Remaps.vnoremap
local vimfn    = Remaps.vimfn
local cnoremap = Remaps.cnoremap

-- planck keymaps
nnoremap("<pageup>", "<c-u>")
vnoremap("<pageup>", "<c-u>")

nnoremap("<pagedown>", "<c-d>")
vnoremap("<pagedown>", "<c-d>")

-- removing the weird binding that doesn't let me go forward
inoremap("<s-tab>", "<C-D>")
vnoremap("<tab>", ">gv")
vnoremap("<s-tab>", "<gv")

-- vnoremap(">", ">gv")
-- vnoremap("<", "<gv")

nnoremap("<m-left>", "10<C-w><")
nnoremap("<m-right>", "10<C-w>>")
nnoremap("<m-up>", "10<C-w>+")
nnoremap("<m-down>", "10<C-w>-")

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
-- nnoremap("<m-o>", vimfn([[ClangdSwitchSourceHeader]]))

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

-- to replace no c-s-v
inoremap("<m-v>", "<c-r>+")
nnoremap("<m-v>", "\"+p")
vnoremap("<m-v>", "\"+p")

nnoremap("<m-c>", "\"+y")
vnoremap("<m-c>", "\"+y")

vnoremap("<leader>p", "\"_dp")
nnoremap("<c-h>", "gT")
nnoremap("<c-l>", "gt")
-- nnoremap("<a-k>", ":tabc<CR>")
-- nnoremap("<a-j>", ":tabnew<CR>")

nnoremap("<leader>sv", vimfn([[source $MYVIMRC]]))

nnoremap("<c-\\>", "<c-w>v") -- vscode

local function netrw()
    if vim.bo.filetype == "netrw" then
        vim.cmd([[Rex]])
    else
        vim.cmd([[Ex]])
    end
end

-- nnoremap("<c-1>", netrw)


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
-- nnoremap("p", "\"+p");
-- vnoremap("p", "\"+p");
--
-- nnoremap("y", "\"+y");
-- vnoremap("y", "\"+y");

-- vim.cmd([[set makeprg=build]])

local is_windows = false

if vim.fn.exists('g:os') == 0 then
  is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
end

if is_windows then
  vim.opt.makeprg = "build"      -- typically
else
  vim.opt.makeprg = "./build.sh" -- typically
end


vim.cmd("command! -nargs=1 -complete=shellcmd MakePrg noautocmd lua vim.opt.makeprg=\"<args>\"")
vim.cmd("command! -nargs=+ -complete=shellcmd Call noautocmd cexpr! system(\"<args>\") | redraw! | copen")

-- nnoremap("<c-s>", function()
--     -- runner.run(vim.opt.makeprg._value)
--     runner.run(vim.opt.makeprg._value, runner.run_in_terminal)
--     -- vim.cmd("tab ter " .. vim.opt.makeprg._value)
-- end)

nnoremap("<f1>", function()
    -- @TODO: find something i like
    -- vim.cmd([[make]])
    -- run_shell("build")
    runner.run_in_terminal(vim.opt.makeprg._value)
end)

nnoremap("<f2>", function()
    -- run_shell("build")
    runner.run_shell("build")
end)

nnoremap("<f3>", function()
    runner.run_shell("run")
end)

nnoremap("<f4>", function()
    -- @TODO: find something i like
    -- vim.cmd([[make]])
    -- run_shell("build")
    runner.run_shell("test")
end)

nnoremap("<f5>", ":make<CR>")
cnoremap("<C-t>", "e <c-r>%", {})
cnoremap("<C-l>", "e %:h", {})
cnoremap("<C-a>", "<home>", {})
cnoremap("<C-e>", "<end>", {})

vim.cmd([[
let g:ackprg = 'rg --vimgrep'
nnoremap <leader>fd :Ack!<Space>
]])



