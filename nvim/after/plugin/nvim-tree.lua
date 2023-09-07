 local Remaps = require("marcusyqy.keymap")
 local nnoremap = Remaps.nnoremap
 local vimfn = Remaps.vimfn
 -- examples for your init.lua

 -- disable netrw at the very start of your init.lua (strongly advised)
 vim.g.loaded_netrw = 0
 vim.g.loaded_netrwPlugin = 0

 -- set termguicolors to enable highlight groups
 vim.opt.termguicolors = true

 local function my_on_attach(bufnr)
     local api = require('nvim-tree.api')
     local function opts(desc)
         return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
     end

     api.config.mappings.default_on_attach(bufnr)
     -- your removals and mappings go here
 end

 local view = require("nvim-tree.view")
 local nvim_tree = require("nvim-tree")


 nvim_tree.setup { -- BEGIN_DEFAULT_OPTS
     auto_reload_on_write = true,
     disable_netrw = false,
     hijack_cursor = true,
     hijack_netrw = true,
     hijack_unnamed_buffer_when_opening = true,
     sort_by = "name",
     root_dirs = {},
     prefer_startup_root = true,
     sync_root_with_cwd = true,
     reload_on_bufenter = false,
     respect_buf_cwd = false,
     on_attach = my_on_attach, -- "default",
     -- remove_keymaps = false,
     select_prompts = false,
     view = {
         centralize_selection = false,
         cursorline = true,
         debounce_delay = 15,
         width = 60,
         hide_root_folder = false,
         side = "left",
         preserve_window_proportions = false,
         number = true,
         relativenumber = true,
         signcolumn = "yes",
         -- mappings = {
         --     custom_only = false,
         --     list = {
         --         -- user mappings go here
         --     },
         -- },
         float = {
             enable = true,
             quit_on_focus_loss = false,
             open_win_config = {
                 -- • "editor" The global editor grid
                 -- • "win" Window given by the `win` field, or current
                 --   window.
                 -- • "cursor" Cursor position in current window.
                 -- • "mouse" Mouse position
                 relative = "cursor",
                 border = "rounded",
                 width = 80,
                 height = 40,
                 row = 2,
                 col = 2,
                 title = "File Explorer",
                 title_pos = "center",
             },
         },
     },
     renderer = {
         add_trailing = false,
         group_empty = false,
         highlight_git = false,
         full_name = false,
         highlight_opened_files = "none",
         highlight_modified = "none",
         root_folder_label = ":~:s?$?/..?",
         indent_width = 2,
         indent_markers = {
             enable = false,
             inline_arrows = true,
             icons = {
                 corner = "└",
                 edge = "│",
                 item = "│",
                 bottom = "─",
                 none = " ",
             },
         },
         icons = {
             webdev_colors = true,
             git_placement = "before",
             modified_placement = "after",
             padding = " ",
             symlink_arrow = " ➛ ",
             show = {
                 file = true,
                 folder = true,
                 folder_arrow = true,
                 git = true,
                 modified = true,
             },
             glyphs = {
                 default = "",
                 symlink = "",
                 bookmark = "",
                 modified = "●",
                 folder = {
                     arrow_closed = "",
                     arrow_open = "",
                     default = "",
                     open = "",
                     empty = "",
                     empty_open = "",
                     symlink = "",
                     symlink_open = "",
                 },
                 git = {
                     unstaged = "✗",
                     staged = "✓",
                     unmerged = "",
                     renamed = "➜",
                     untracked = "★",
                     deleted = "",
                     ignored = "◌",
                 },
             },
         },
         special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
         symlink_destination = true,
     },
     hijack_directories = {
         enable = true,
         auto_open = true,
     },
     update_focused_file = {
         enable = true,
         update_root = false,
         ignore_list = {},
     },
     system_open = {
         cmd = "",
         args = {},
     },
     diagnostics = {
         enable = false,
         show_on_dirs = false,
         show_on_open_dirs = true,
         debounce_delay = 50,
         severity = {
             min = vim.diagnostic.severity.HINT,
             max = vim.diagnostic.severity.ERROR,
         },
         icons = {
             hint = "",
             info = "",
             warning = "",
             error = "",
         },
     },
     filters = {
         dotfiles = false,
         git_clean = false,
         no_buffer = false,
         custom = {},
         exclude = {},
     },
     filesystem_watchers = {
         enable = true,
         debounce_delay = 50,
         ignore_dirs = {},
     },
     git = {
         enable = true,
         ignore = true,
         show_on_dirs = true,
         show_on_open_dirs = true,
         timeout = 400,
     },
     modified = {
         enable = false,
         show_on_dirs = true,
         show_on_open_dirs = true,
     },
     actions = {
         use_system_clipboard = true,
         change_dir = {
             enable = true,
             global = false,
             restrict_above_cwd = false,
         },
         expand_all = {
             max_folder_discovery = 300,
             exclude = {},
         },
         file_popup = {
             open_win_config = {
                 col = 1,
                 row = 1,
                 relative = "cursor",
                 border = "shadow",
                 style = "minimal",
             },
         },
         open_file = {
             quit_on_open = true,
             resize_window = true,
             window_picker = {
                 enable = false,
                 picker = "default",
                 chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                 exclude = {
                     filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                     buftype = { "nofile", "terminal", "help" },
                 },
             },
         },
         remove_file = {
             close_window = true,
         },
     },
     trash = {
         cmd = "gio trash",
     },
     live_filter = {
         prefix = "[FILTER]: ",
         always_show_folders = true,
     },
     tab = {
         sync = {
             open = false,
             close = false,
             ignore = {},
         },
     },
     notify = {
         threshold = vim.log.levels.INFO,
     },
     ui = {
         confirm = {
             remove = true,
             trash = true,
         },
     },
     log = {
         enable = false,
         truncate = false,
         types = {
             all = false,
             config = false,
             copy_paste = false,
             dev = false,
             diagnostics = false,
             git = false,
             profile = false,
             watcher = false,
         },
     },
 } -- END_DEFAULT_OPTS



 nnoremap("<c-n>", vimfn([[NvimTreeToggle]]))

 -- local function local_toggle()
 --     if view.is_visible() then
 --         view.close()
 --     else
 --         local buf = vim.api.nvim_get_current_buf()
 --         local bufname = vim.api.nvim_buf_get_name(buf)
 --         if bufname == nil or bufname == "" then
 --             require("nvim-tree.api").tree.toggle()
 --         else
 --             nvim_tree.open_replacing_current_buffer(
 --                 vim.fn.getcwd())
 --         end
 --     end
 -- end
 -- nnoremap("<c-n>", local_toggle)
 --
 -- -- disable netrw at the very start of your init.lua (strongly advised)
 -- vim.g.loaded_netrw = 0
 -- vim.g.loaded_netrwPlugin = 0
 --
 -- -- set termguicolors to enable highlight groups
 -- vim.opt.termguicolors = true
 --
 -- local function my_on_attach(bufnr)
 --     local api = require('nvim-tree.api')
 --     local function opts(desc)
 --         return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
 --     end
 --
 --     api.config.mappings.default_on_attach(bufnr)
 --     -- your removals and mappings go here
 -- end
 --
 -- local view = require("nvim-tree.view")
 -- local nvim_tree = require("nvim-tree")
 --
 --
 -- nvim_tree.setup { -- BEGIN_DEFAULT_OPTS
 --     auto_reload_on_write = true,
 --     disable_netrw = false,
 --     hijack_cursor = true,
 --     hijack_netrw = true,
 --     hijack_unnamed_buffer_when_opening = true,
 --     sort_by = "name",
 --     root_dirs = {},
 --     prefer_startup_root = true,
 --     sync_root_with_cwd = true,
 --     reload_on_bufenter = false,
 --     respect_buf_cwd = false,
 --     on_attach = my_on_attach, -- "default",
 --     remove_keymaps = false,
 --     select_prompts = false,
 --     view = {
 --         centralize_selection = false,
 --         cursorline = true,
 --         debounce_delay = 15,
 --         width = 60,
 --         hide_root_folder = false,
 --         side = "left",
 --         preserve_window_proportions = false,
 --         number = true,
 --         relativenumber = true,
 --         signcolumn = "yes",
 --         mappings = {
 --             custom_only = false,
 --             list = {
 --                 -- user mappings go here
 --             },
 --         },
 --         float = {
 --             enable = true,
 --             quit_on_focus_loss = false,
 --             open_win_config = {
 --                 -- • "editor" The global editor grid
 --                 -- • "win" Window given by the `win` field, or current
 --                 --   window.
 --                 -- • "cursor" Cursor position in current window.
 --                 -- • "mouse" Mouse position
 --                 relative = "cursor",
 --                 border = "rounded",
 --                 width = 80,
 --                 height = 40,
 --                 row = 2,
 --                 col = 2,
 --                 title = "File Explorer",
 --                 title_pos = "center",
 --             },
 --         },
 --     },
 --     renderer = {
 --         add_trailing = false,
 --         group_empty = false,
 --         highlight_git = false,
 --         full_name = false,
 --         highlight_opened_files = "none",
 --         highlight_modified = "none",
 --         root_folder_label = ":~:s?$?/..?",
 --         indent_width = 2,
 --         indent_markers = {
 --             enable = false,
 --             inline_arrows = true,
 --             icons = {
 --                 corner = "└",
 --                 edge = "│",
 --                 item = "│",
 --                 bottom = "─",
 --                 none = " ",
 --             },
 --         },
 --         icons = {
 --             webdev_colors = true,
 --             git_placement = "before",
 --             modified_placement = "after",
 --             padding = " ",
 --             symlink_arrow = " ➛ ",
 --             show = {
 --                 file = true,
 --                 folder = true,
 --                 folder_arrow = true,
 --                 git = true,
 --                 modified = true,
 --             },
 --             glyphs = {
 --                 default = "",
 --                 symlink = "",
 --                 bookmark = "",
 --                 modified = "●",
 --                 folder = {
 --                     arrow_closed = "",
 --                     arrow_open = "",
 --                     default = "",
 --                     open = "",
 --                     empty = "",
 --                     empty_open = "",
 --                     symlink = "",
 --                     symlink_open = "",
 --                 },
 --                 git = {
 --                     unstaged = "✗",
 --                     staged = "✓",
 --                     unmerged = "",
 --                     renamed = "➜",
 --                     untracked = "★",
 --                     deleted = "",
 --                     ignored = "◌",
 --                 },
 --             },
 --         },
 --         special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
 --         symlink_destination = true,
 --     },
 --     hijack_directories = {
 --         enable = true,
 --         auto_open = true,
 --     },
 --     update_focused_file = {
 --         enable = true,
 --         update_root = false,
 --         ignore_list = {},
 --     },
 --     system_open = {
 --         cmd = "",
 --         args = {},
 --     },
 --     diagnostics = {
 --         enable = false,
 --         show_on_dirs = false,
 --         show_on_open_dirs = true,
 --         debounce_delay = 50,
 --         severity = {
 --             min = vim.diagnostic.severity.HINT,
 --             max = vim.diagnostic.severity.ERROR,
 --         },
 --         icons = {
 --             hint = "",
 --             info = "",
 --             warning = "",
 --             error = "",
 --         },
 --     },
 --     filters = {
 --         dotfiles = false,
 --         git_clean = false,
 --         no_buffer = false,
 --         custom = {},
 --         exclude = {},
 --     },
 --     filesystem_watchers = {
 --         enable = true,
 --         debounce_delay = 50,
 --         ignore_dirs = {},
 --     },
 --     git = {
 --         enable = true,
 --         ignore = true,
 --         show_on_dirs = true,
 --         show_on_open_dirs = true,
 --         timeout = 400,
 --     },
 --     modified = {
 --         enable = false,
 --         show_on_dirs = true,
 --         show_on_open_dirs = true,
 --     },
 --     actions = {
 --         use_system_clipboard = true,
 --         change_dir = {
 --             enable = true,
 --             global = false,
 --             restrict_above_cwd = false,
 --         },
 --         expand_all = {
 --             max_folder_discovery = 300,
 --             exclude = {},
 --         },
 --         file_popup = {
 --             open_win_config = {
 --                 col = 1,
 --                 row = 1,
 --                 relative = "cursor",
 --                 border = "shadow",
 --                 style = "minimal",
 --             },
 --         },
 --         open_file = {
 --             quit_on_open = true,
 --             resize_window = true,
 --             window_picker = {
 --                 enable = false,
 --                 picker = "default",
 --                 chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
 --                 exclude = {
 --                     filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
 --                     buftype = { "nofile", "terminal", "help" },
 --                 },
 --             },
 --         },
 --         remove_file = {
 --             close_window = true,
 --         },
 --     },
 --     trash = {
 --         cmd = "gio trash",
 --     },
 --     live_filter = {
 --         prefix = "[FILTER]: ",
 --         always_show_folders = true,
 --     },
 --     tab = {
 --         sync = {
 --             open = false,
 --             close = false,
 --             ignore = {},
 --         },
 --     },
 --     notify = {
 --         threshold = vim.log.levels.INFO,
 --     },
 --     ui = {
 --         confirm = {
 --             remove = true,
 --             trash = true,
 --         },
 --     },
 --     log = {
 --         enable = false,
 --         truncate = false,
 --         types = {
 --             all = false,
 --             config = false,
 --             copy_paste = false,
 --             dev = false,
 --             diagnostics = false,
 --             git = false,
 --             profile = false,
 --             watcher = false,
 --         },
 --     },
 -- } -- END_DEFAULT_OPTS
 --
 --
 --
 -- nnoremap("<c-n>", vimfn([[NvimTreeToggle]]))

 -- local function local_toggle()
 --     if view.is_visible() then
 --         view.close()
 --     else
 --         local buf = vim.api.nvim_get_current_buf()
 --         local bufname = vim.api.nvim_buf_get_name(buf)
 --         if bufname == nil or bufname == "" then
 --             require("nvim-tree.api").tree.toggle()
 --         else
 --             nvim_tree.open_replacing_current_buffer(
 --                 vim.fn.getcwd())
 --         end
 --     end
 -- end
 -- nnoremap("<c-n>", local_toggle)
 --
 -- nnoremap("<c-n>", function()
 --     -- local previous_buf = vim.api.nvim_get_current_buf()
 --     require("nvim-tree").open_replacing_current_buffer()
 --     -- require("nvim-tree").find_file(false, previous_buf)
 -- end)
