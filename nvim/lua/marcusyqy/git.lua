local nnoremap = require("marcusyqy.keymap").nnoremap

nnoremap("<leader>dl", ":diffget //3<CR>")
nnoremap("<leader>dh", ":diffget //2<CR>")
nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
