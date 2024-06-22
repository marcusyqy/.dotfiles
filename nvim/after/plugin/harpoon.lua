local nnoremap = require("marcusyqy.keymap").nnoremap

local status, _ = pcall(require, "harpoon")
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

nnoremap("<leader>ha", function() require("harpoon.mark").add_file() end)
nnoremap("<leader>ht", function() require("harpoon.cmd-ui").toggle_quick_menu()end)
nnoremap("<leader>hp", function() require("harpoon.ui").toggle_quick_menu()end)

nnoremap("<leader>hh", function() require("harpoon.ui").nav_file(1)end)
nnoremap("<leader>hj", function() require("harpoon.ui").nav_file(2)end)
nnoremap("<leader>hk", function() require("harpoon.ui").nav_file(3)end)
nnoremap("<leader>hl", function() require("harpoon.ui").nav_file(4)end)
nnoremap("<leader>h;", function() require("harpoon.ui").nav_file(5)end)
nnoremap("<leader>h'", function() require("harpoon.ui").nav_file(6)end)

