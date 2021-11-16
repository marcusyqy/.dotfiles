lua << EOF
local status, lfs = pcall(require, "harpoon")
if(not status) then
    --lfs exists, so use it.
    print("does not have harpoon!")
    return
end

require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
    },
    nav_first_in_list = true
})
EOF

nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ht :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>hh :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hj :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>hk :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>hl :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>h; :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>h' :lua require("harpoon.ui").nav_file(6)<CR>

