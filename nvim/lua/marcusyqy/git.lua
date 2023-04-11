local nnoremap = require("marcusyqy.keymap").nnoremap
nnoremap("<leader>dj", ":diffget //3<CR>")
nnoremap("<leader>df", ":diffget //2<CR>")

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
