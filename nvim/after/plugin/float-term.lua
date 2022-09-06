local Remaps = require("marcusyqy.keymap")
local nnoremap = Remaps.nnoremap
local tnoremap = Remaps.tnoremap

-- maybe map vim esc too
tnoremap("<esc>", "<c-\\><c-n>")
tnoremap("<c-[>", "<c-\\><c-n>")

-- toggle
nnoremap("<C-t>", ":FloatermToggle<CR>")
tnoremap("<C-t>", "<C-\\><C-n>:FloatermToggle<CR>")

-- new terminal in tab
nnoremap("<leader>tt", ":tabnew<CR>:term<CR>a")
nnoremap("<leader>ts", "<c-w>s<c-w>j:term<CR>a")
nnoremap("<leader>tv", "<c-w>v<c-w>l:term<CR>a")

