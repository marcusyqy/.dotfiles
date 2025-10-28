local Remaps = require("marcusyqy.keymap")
local nnoremap = Remaps.nnoremap
local tnoremap = Remaps.tnoremap

-- maybe map vim esc too
-- tnoremap("esc", "<c-\\><c-n>")
tnoremap("<c-[>", "<c-\\><c-n>")

-- new terminal in tab
nnoremap("<leader>tt", ":tabnew<CR>:term<CR>a")
nnoremap("<leader>ts", "<c-w>s:term<CR>a")
nnoremap("<leader>tv", "<c-w>v:term<CR>a")

