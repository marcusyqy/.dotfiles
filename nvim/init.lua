
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd([[
    syntax on
    filetype off "required
    syntax enable
]])


-- language
vim.g.python_recommended_style = 0
vim.g.lsp_cxx_hl_use_text_props = 1

-- OPTIONS
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.opt.updatetime = 50
-- vim.opt.guicursor = ""
-- vim.opt.guicursor='n:blinkon1,i-'

vim.opt.guicursor='n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- set nocompatible "be iMproved
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = true
vim.opt.hlsearch = true
vim.opt.ruler = true

-- for windows
-- vim.cmd([[set shellslash]])

vim.opt.errorbells = true

-- we should put 4 for work.
if(os.getenv("motional") ~= nil) then
  print("motional mode")
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
else -- preference
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2
end

vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.splitkeep = "cursor"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.laststatus = 3
vim.opt.showmode = true

vim.opt.cursorline = false -- true

-- display chars for tabs and trailing spaces
-- vim.opt.listchars="eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"
-- vim.opt.list = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.noswapfile = true
-- vim.opt.nobackup = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = vim.fn.expand('~/.vim/undodir/')
vim.opt.wildmode="list:longest,full"
vim.opt.wildignore:append(".git")
vim.opt.wildignorecase = true

vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.inccommand = "split" -- for :substitute - i love it

-- Some servers have issues with backup files, see #649.
vim.g.nowritebackup = true

-- should i remove this to get better mappings of H and L ?
vim.opt.scrolloff = 0 -- 8 -- test this out.
vim.opt.signcolumn = "no" -- change to "yes" to get something weird. and "auto" is really wonky
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
vim.opt.colorcolumn = "" -- "120"

vim.o.background = 'dark'
vim.opt.mouse= "a"
-- if(os.getenv("TMUX") ~= nil) then -- disable mouse in tmux
--     vim.opt.mouse= ""
-- else
--     vim.opt.mouse= "a"
-- end


vim.opt.cinoptions="l1"
vim.opt.termguicolors=true
-- vim.opt.termguicolors = os.getenv("SSH_TTY") == nil

-- vim.opt.showbreak='↪'
vim.opt.list = true
vim.opt.listchars='tab:→ ,nbsp:␣,trail:•' -- ,eol:↲,extends:⟩,precedes:⟨'

vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end



-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "RRethy/base16-nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme 'base16-default-dark'
      end,
    },
    {
      "sainnhe/everforest",
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.everforest_better_performance = 1
        vim.g.everforest_background = 'hard'
        vim.g.everforest_enable_italic = 1
        vim.g.everforest_transparent_background = 1
        vim.g.everforest_ui_contrast = 'high'
        -- vim.cmd.colorscheme 'everforest'
        -- vim.cmd([[colorscheme ]])
      end,
    },
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      ---@type snacks.Config
      opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        image = { enabled = false, formats = {} },
        indent = { enabled = true, animate = { enabled = false } },
        input = { enabled = false },
        notifier = {
          enabled = false,
          timeout = 3000,
        },
        picker = {
          enabled = true,
          prompt = "   ",
          win = {
            -- input window
            input = {
              keys = {
                -- to close the picker on ESC instead of going to normal mode,
                -- add the following keymap to your config
                -- ["<Esc>"] = { "close", mode = { "n", "i" } },
                ["/"] = "toggle_focus",
                ["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
                ["<C-Up>"] = { "history_back", mode = { "i", "n" } },
                ["<C-c>"] = { "cancel", mode = "i" },
                ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
                ["<CR>"] = { "confirm", mode = { "n", "i" } },
                ["<Down>"] = { "list_down", mode = { "i", "n" } },
                ["<Esc>"] = "cancel",
                ["<C-a>"]= { "<Home>", mode = "i", expr = true },
                ["<C-e>"]= { "<End>", mode = "i", expr = true },
                ["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
                ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
                ["<Up>"] = { "list_up", mode = { "i", "n" } },
                ["<a-d>"] = { "inspect", mode = { "n", "i" } },
                ["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
                ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
                ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                ["<a-r>"] = { "toggle_regex", mode = { "i", "n" } },
                ["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
                ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
                ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
                ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
                ["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
                ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
                ["<c-j>"] = { "list_down", mode = { "i", "n" } },
                ["<c-k>"] = { "list_up", mode = { "i", "n" } },
                ["<c-n>"] = { "list_down", mode = { "i", "n" } },
                ["<c-p>"] = { "list_up", mode = { "i", "n" } },
                ["<c-q>"] = { "qflist", mode = { "i", "n" } },
                ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
                ["<c-t>"] = { "tab", mode = { "n", "i" } },
                ["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
                ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
                ["<c-r>#"] = { "insert_alt", mode = "i" },
                ["<c-r>%"] = { "insert_filename", mode = "i" },
                ["<c-r><c-a>"] = { "insert_cWORD", mode = "i" },
                ["<c-r><c-f>"] = { "insert_file", mode = "i" },
                ["<c-r><c-l>"] = { "insert_line", mode = "i" },
                ["<c-r><c-p>"] = { "insert_file_full", mode = "i" },
                ["<c-r><c-w>"] = { "insert_cword", mode = "i" },
                ["<c-w>H"] = "layout_left",
                ["<c-w>J"] = "layout_bottom",
                ["<c-w>K"] = "layout_top",
                ["<c-w>L"] = "layout_right",
                ["?"] = "toggle_help_input",
                ["G"] = "list_bottom",
                ["gg"] = "list_top",
                ["j"] = "list_down",
                ["k"] = "list_up",
                ["q"] = "close",
              },
              b = {
                minipairs_disable = true,
              },
            }
          }
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = false },
        styles = {
          notification = {
            -- wo = { wrap = true } -- Wrap notifications
          }
        }
      },
      keys = {
        -- Top Pickers & Explorer
        -- { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        -- { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
        -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
        -- find
        { "<c-b>", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<c-p>", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "Search help files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
        -- Grep
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        -- { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
        -- { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
        -- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
        -- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        -- { "<leader>s:", function() Snacks.picker.command_history() end, desc = "Command History" },
        -- { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
        -- { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        -- { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        -- { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
        -- { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        -- { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        -- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
        -- { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
        -- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
        -- { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
        -- { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        -- { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
        -- { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
        -- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        -- { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
        -- { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>ds", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        -- Other
        { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
        -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
        -- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
        -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
        -- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      },
      init = function()
        vim.api.nvim_create_autocmd("User", {
          pattern = "VeryLazy",
          callback = function()
            -- Setup some globals for debugging (lazy-loaded)
            _G.dd = function(...)
              Snacks.debug.inspect(...)
            end
            _G.bt = function()
              Snacks.debug.backtrace()
            end

            -- Override print to use snacks for `:=` command
            if vim.fn.has("nvim-0.11") == 1 then
              vim._print = function(_, ...)
                dd(...)
              end
            else
              vim.print = _G.dd
            end

            -- Create some toggle mappings
            -- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
            -- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
            -- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
            -- Snacks.toggle.diagnostics():map("<leader>ud")
            -- Snacks.toggle.line_number():map("<leader>ul")
            -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
            -- Snacks.toggle.treesitter():map("<leader>uT")
            Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
            -- Snacks.toggle.inlay_hints():map("<leader>uh")
            -- Snacks.toggle.indent():map("<leader>ug")
            -- Snacks.toggle.dim():map("<leader>uD")
          end,
        })
      end,
    },
    { "folke/todo-comments.nvim", },
    {
      "stevearc/oil.nvim", opts = {
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you still want to use netrw.
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = false,
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = false,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,
        -- Oil will automatically delete hidden buffers after this delay
        -- You can set the delay to false to disable cleanup entirely
        -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
          -- Time to wait for LSP file operations to complete before skipping
          timeout_ms = 1000,
          -- Set to true to autosave buffers that are updated with LSP willRenameFiles
          -- Set to "unmodified" to only save unmodified buffers
          autosave_changes = false,
        },
        -- Constrain the cursor to the editable parts of the oil buffer
        -- Set to `false` to disable, or "name" to keep it on the file names
        constrain_cursor = "editable",
        -- Set to true to watch the filesystem for changes and reload oil
        experimental_watch_for_changes = false,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          -- ["<C-e>"] = "actions.select",
          -- ["<C-e>"] = "actions.select_vsplit",
          ["<C-s>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-c>"] = "actions.close",
          ["<C-n>"] = "actions.close",
          ["<C-e>"] = "actions.refresh",
          ["<C-y>"] = "actions.parent",
          ["-"] = "actions.preview",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = false,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          -- Sort file names in a more intuitive order for humans. Is less performant,
          -- so you may want to set to false if you work with large directories.
          natural_order = true,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        -- Extra arguments to pass to SCP when moving/copying files over SSH
        extra_scp_args = {},
        -- EXPERIMENTAL support for performing file operations with git
        git = {
          -- Return true to automatically git add/mv/rm files
          add = function(path)
            return false
          end,
          mv = function(src_path, dest_path)
            return false
          end,
          rm = function(path)
            return false
          end,
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        -- Configuration for the actions floating preview window
        preview = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
          max_height = 0.9,
          -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
        },
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
        -- Configuration for the floating SSH window
        ssh = {
          border = "rounded",
        },
        -- Configuration for the floating keymaps help window
        keymaps_help = {
          border = "rounded",
        },
      },
    },
    { "duane9/nvim-rg" },
    {
      "numToStr/Comment.nvim",
      opts = {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = 'gcc',
          ---Block-comment toggle keymap
          block = 'gbc',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = 'gc',
          ---Block-comment keymap
          block = 'gb',
        },
        ---LHS of extra mappings
        extra = {
          ---Add comment on the line above
          above = 'gcO',
          ---Add comment on the line below
          below = 'gco',
          ---Add comment at the end of line
          eol = 'gcA',
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
      }
    },
    { "folke/lazydev.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "tpope/vim-fugitive" },
    {
      "NeogitOrg/neogit",
      lazy = true,
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
        "nvim-mini/mini.pick",           -- optional
        "folke/snacks.nvim",             -- optional
      },
      cmd = "Neogit",
      keys = {
        { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
      }
    },
    { "sainnhe/everforest" },
    { "ellisonleao/gruvbox.nvim" },
    { "hrsh7th/nvim-cmp",
      dependencies = {
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
        { "onsails/lspkind-nvim" },
      },
      opts = function()
        local cmp = require("cmp")
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')
        return {
          snippet = {
            expand = function(args)
              -- For `vsnip` user.
              -- vim.fn["vsnip#anonymous"](args.body)

              -- For `luasnip` user.
              luasnip.lsp_expand(args.body)

              -- For `ultisnips` user.
              -- vim.fn["UltiSnips#Anon"](args.body)
            end,
          },
          mapping = {
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-,>'] = cmp.mapping.complete(),
            ['<Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end,
            ['<S-Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end,
            ['<down>'] = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end,
            ['<up>'] = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end,
            ['<c-n>'] = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end,
            ['<c-p>'] = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end,
            ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
          },
          sources = {
            { name = 'nvim_lsp' },

            -- For vsnip user.
            -- { name = 'vsnip' },
            { name = 'nvim_lua' },

            -- For luasnip user.
            { name = 'luasnip' },

            -- for paths
            { name = 'path' },

            -- For ultisnips user.
            -- { name = 'ultisnips' },
            { name = 'buffer',  keyword_length = 4 },
          },
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          formatting = {
            format = lspkind.cmp_format({
              with_text = true,
              mode = "symbol",
              maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
              ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
              -- The function below will be called before any actual modifications from lspkind
              -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
              menu = ({
                buffer = "[buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                luasnip = "[snippets]",
                path = "[path]"
              })
            })
          },
          experimental = {
            native_menu = false,
            ghost_text = false,
          },
          sorting = {
            comparators = {
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.recently_used,
              cmp.config.compare.kind,
              cmp.config.compare.sort_text,
              cmp.config.compare.length,
              cmp.config.compare.order,
            },
          },
        }
      end,
    },
    {
        "folke/noice.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim",
        },
        config = function()
            require("noice").setup({
            cmdline = {
                enabled = false, -- enables the Noice cmdline UI
                view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                opts = {}, -- global options for the cmdline. See section on views
                ---@type table<string, CmdlineFormat>
                format = {
                    -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                    -- view: (default is cmdline view)
                    -- opts: any options passed to the view
                    -- icon_hl_group: optional hl_group for the icon
                    -- title: set to anything or empty string to hide
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                    input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
                    -- lua = false, -- to disable a format, set to `false`
                },
            },
            messages = {
                -- NOTE: If you enable messages, then the cmdline is enabled automatically.
                -- This is a current Neovim limitation.
                enabled = false, -- enables the Noice messages UI
                view = "notify", -- default view for messages
                view_error = "notify", -- view for errors
                view_warn = "notify", -- view for warnings
                view_history = "messages", -- view for :messages
                view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
            },
            popupmenu = {
                enabled = false, -- enables the Noice popupmenu UI
                ---@type 'nui'|'cmp'
                backend = "nui", -- backend to use to show regular cmdline completions
                ---@type NoicePopupmenuItemKind|false
                -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
                kind_icons = {}, -- set to `false` to disable icons
            },
            -- default options for require('noice').redirect
            -- see the section on Command Redirection
            ---@type NoiceRouteConfig
            redirect = {
                view = "popup",
                filter = { event = "msg_show" },
            },
            -- You can add any custom commands below that will be available with `:Noice command`
            ---@type table<string, NoiceCommand>
            commands = {
                history = {
                    -- options for the message history that you get with `:Noice`
                    view = "split",
                    opts = { enter = true, format = "details" },
                    filter = {
                        any = {
                            { event = "notify" },
                            { error = true },
                            { warning = true },
                            { event = "msg_show", kind = { "" } },
                            { event = "lsp", kind = "message" },
                        },
                    },
                },
                -- :Noice last
                last = {
                    view = "popup",
                    opts = { enter = true, format = "details" },
                    filter = {
                        any = {
                            { event = "notify" },
                            { error = true },
                            { warning = true },
                            { event = "msg_show", kind = { "" } },
                            { event = "lsp", kind = "message" },
                        },
                    },
                    filter_opts = { count = 1 },
                },
                -- :Noice errors
                errors = {
                    -- options for the message history that you get with `:Noice`
                    view = "popup",
                    opts = { enter = true, format = "details" },
                    filter = { error = true },
                    filter_opts = { reverse = true },
                },
                all = {
                    -- options for the message history that you get with `:Noice`
                    view = "split",
                    opts = { enter = true, format = "details" },
                    filter = {},
                },
            },
            notify = {
                -- Noice can be used as `vim.notify` so you can route any notification like other messages
                -- Notification messages have their level and other properties set.
                -- event is always "notify" and kind can be any log level as a string
                -- The default routes will forward notifications to nvim-notify
                -- Benefit of using Noice for this is the routing and consistent history view
                enabled = true,
                view = "notify",
            },
            lsp = {
                progress = {
                    enabled = true,
                    -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                    -- See the section on formatting for more details on how to customize.
                    --- @type NoiceFormat|string

                    --- @type NoiceFormat|string
                    format_done = "lsp_progress_done",
                    throttle = 1000 / 30, -- frequency to update lsp progress message
                    view = "mini",
                },
                override = {
                    -- override the default lsp markdown formatter with Noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    -- override the lsp markdown formatter with Noice
                    ["vim.lsp.util.stylize_markdown"] = false,
                    -- override cmp documentation with Noice (needs the other options to work)
                    ["cmp.entry.get_documentation"] = false,
                },
                hover = {
                    enabled = true,
                    silent = false, -- set to true to not show a message if hover is not available
                    view = nil, -- when nil, use defaults from documentation
                    ---@type NoiceViewOptions
                    opts = {}, -- merged with defaults from documentation
                },
                signature = {
                    enabled = true,
                    auto_open = {
                        enabled = true,
                        trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                        luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                        throttle = 50, -- Debounce lsp signature help request by 50ms
                    },
                    view = nil, -- when nil, use defaults from documentation
                    ---@type NoiceViewOptions
                    opts = {}, -- merged with defaults from documentation
                },
                message = {
                    -- Messages shown by lsp servers
                    enabled = true,
                    view = "notify",
                    opts = {},
                },
                -- defaults for hover and signature help
                documentation = {
                    view = "hover",
                    ---@type NoiceViewOptions
                    opts = {
                        lang = "markdown",
                        replace = true,
                        render = "plain",
                        format = { "{message}" },
                        win_options = { concealcursor = "n", conceallevel = 3 },
                    },
                },
            },
            markdown = {
                hover = {
                    ["|(%S-)|"] = vim.cmd.help, -- vim help links
                    ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
                },
                highlights = {
                    ["|%S-|"] = "@text.reference",
                    ["@%S+"] = "@parameter",
                    ["^%s*(Parameters:)"] = "@text.title",
                    ["^%s*(Return:)"] = "@text.title",
                    ["^%s*(See also:)"] = "@text.title",
                    ["{%S-}"] = "@parameter",
                },
            },
            health = {
                checker = true, -- Disable if you don't want health checks to run
            },
            ---@type NoicePresets
            presets = {
                -- you can enable a preset by setting it to true, or a table that will override the preset config
                -- you can also add custom presets that you can enable/disable with enabled=true
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = false, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
            ---@type NoiceConfigViews
            views = {}, ---@see section on views
            ---@type NoiceRouteConfig[]
            routes = {}, --- @see section on routes
            ---@type table<string, NoiceFilter>
            status = {}, --- @see section on statusline components
            ---@type NoiceFormatOptions
            format = {}, --- @see section on formatting
        })
        end
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "mason.nvim",
        {"mason-org/mason-lspconfig.nvim", opts = { ensure_installed = { "clangd", "lua_ls"} } },
        { "hrsh7th/nvim-cmp" },
      },
      config = function()
        vim.lsp.set_log_level("error")
        vim.lsp.config("pylsp", {
            settings = {
                pylsp = {
                    plugins = {
                        pyflakes = { enabled = false },
                        pycodestyle = { enabled = false },
                        pydocstyle = { enabled = false },
                        pylint = { enabled = false },
                        mccabe = { enabled = false },
                    },
                },
            }
        })
        vim.lsp.config("*", {
        })
        vim.lsp.config("clangd", {
            -- "--header-insertion-decorators",
            -- "--function-arg-placeholders",
            -- "--completion-style=detailed",
            -- "--clang-tidy=false",
            -- "--query-driver=**"
          cmd = {
            "clangd",
            "--header-insertion=never",
            "--j=4",
            "--pch-storage=memory",
            "--compile-commands-dir=${workspaceFolder}/",
            "--background-index",
            "--suggest-missing-includes",
            "--clang-tidy",
            "--all-scopes-completion",
            "--query-driver=/**/*"
          }
        })
      end,
    },
    {
      "mason-org/mason.nvim",
      cmd = "Mason",
      build = ":MasonUpdate",
      opts = {},
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "typescript" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        ignore_install = {},

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
          enable = true,

          -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
          -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
          -- the name of the parser)
          -- list of language that will be disabled
          -- disable = { "c", "rust" },
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = true,
        },
      }
    },
    { "peterhoeg/vim-qml" },
    { "bfrg/vim-cpp-modern" },
    { "evanleck/vim-svelte" },
    { "martinda/Jenkinsfile-vim-syntax" },
    { "kalvinpearce/ShaderHighlight" },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
              'WinEnter',
              'BufEnter',
              'BufWritePost',
              'SessionLoadPost',
              'FileChangedShellPost',
              'VimResized',
              'Filetype',
              'CursorMoved',
              'CursorMovedI',
              'ModeChanged',
            },
          }
        },
        sections = {
          lualine_a = {{'mode', fmt = function(res) return res:sub(1,1) end }},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "default" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})


-- keybinds
vim.keymap.set("n", "<c-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("i", "<s-tab>", "<C-D>", { desc = "Backward when s-tab in insert mode." })
vim.keymap.set("i", "<s-tab>", "<C-D>", { desc = "Backward when s-tab in insert mode." })

vim.keymap.set("i", "<C-d>", "<del>", { desc = "Del backwards" })
vim.keymap.set("i", "<C-k>", "<c-o>D", { desc = "Del behind the line" })

vim.keymap.set("v", "<tab>", ">gv", { desc = "Indent block forward" })
vim.keymap.set("v", "<s-tab>", "<gv", { desc = "Indent block backward" })

vim.keymap.set("n", "<f5>", ":Recompile<CR>")
vim.keymap.set("n", "<c-\\>", ":Recompile<CR>")
vim.keymap.set("n", "<leader>bi", ":Compile<CR>")
vim.keymap.set("n", "<leader>bo", ":Recompile<CR>")
vim.keymap.set("n", "<leader>fj", ":NextError<CR>")
vim.keymap.set("n", "<leader>fk", ":PrevError<CR>")

vim.keymap.set({"i", "c"}, "<C-a>", "<home>", {})
vim.keymap.set({"i", "c"}, "<C-e>", "<end>", {})

vim.keymap.set("i", "<m-v>", "<c-r>+")
vim.keymap.set("n", "<m-v>", "\"+p")
vim.keymap.set("v", "<m-v>", "\"+p")

vim.keymap.set("n", "<m-c>", "\"+y")
vim.keymap.set("v", "<m-c>", "\"+y")


vim.keymap.set("i", "<c-c>", "<esc>")

-- center cursor
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yanks
vim.keymap.set("n", "<leader>fy", function() vim.cmd([[let @+=@%]]) end)
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<leader>y", "\"+y$")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>p", "\"_dP")


vim.keymap.set("n", "<m-left>", "10<C-w><")
vim.keymap.set("n", "<m-right>", "10<C-w>>")
vim.keymap.set("n", "<m-up>", "10<C-w>+")
vim.keymap.set("n", "<m-down>", "10<C-w>-")
vim.keymap.set("n", "<leader>o", ":t.<cr>")
vim.keymap.set("n", "<leader>O", ":t.-1<cr>")


-- terminal
-- double tap
vim.keymap.set("t", "<c-[><c-[>", "<c-\\><c-n>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
-- vim.keymap.set("t", "<c-[>", "<c-\\><c-n>")
vim.keymap.set("t", "<m-v>", "<c-\\><c-o>\"+p") -- enable paste.

-- new terminal in tab
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>:term<CR>a")
vim.keymap.set("n", "<leader>ts", "<c-w>s:term<CR>a")
vim.keymap.set("n", "<leader>tv", "<c-w>v:term<CR>a")

-- Open a terminal at the bottom of the screen with a fixed height.
-- vim.keymap.set("n", "<leader>ts", function()
--   vim.cmd.new()
--   vim.cmd.wincmd "J"
--   vim.api.nvim_win_set_height(0, 12)
--   vim.wo.winfixheight = true
--   vim.cmd.term()
-- end)


-- quick fix list
vim.keymap.set("n", "<c-j>", ":cnext<CR>zz", { desc =  "Quick fix list next" })
vim.keymap.set("n", "<c-k>", ":cprev<CR>zz", { desc = "Quick fix list prev" })
vim.keymap.set("n", "gj", ":lnext<CR>zz", { desc = "Local Quick fix list next" })
vim.keymap.set("n", "gk", ":lprev<CR>zz", { desc = "Local Quick fix list prev" })
vim.keymap.set("n", "gk", ":lprev<CR>zz", { desc = "Local Quick fix list prev" })

local marcusyqy_qf_l = 0
local marcusyqy_qf_g = 0

local ToggleQFList = function(globs)
    if globs then
        if marcusyqy_qf_g == 1 then
            marcusyqy_qf_g = 0
            vim.cmd("cclose")
        else
            marcusyqy_qf_g = 1
            vim.cmd("copen")
        end
    else
        if marcusyqy_qf_l == 1 then
            marcusyqy_qf_l = 0
            vim.cmd("lclose")
        else
            marcusyqy_qf_l = 1
            vim.cmd("lopen")
        end
    end
end

vim.keymap.set("n", "<C-q>", function() ToggleQFList(true) end, { desc = "Open Global QF List" })
vim.keymap.set("n", "<leader>q", function() ToggleQFList(false) end, { desc = "Open Local QF List" })

vim.cmd([[
  cnoreabbrev g Git
  cnoreabbrev gopen GBrowse
]])

local augroup = vim.api.nvim_create_augroup
MarcusYqyGroup = augroup('MarcusYqy', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- remove white spaces
autocmd({ "BufWritePre" }, {
    group = MarcusYqyGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf;
    if not client then
      return
    end
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', '<leader>rr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set('n', '<leader>R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --vim.keymap.set('n', '<leader>gh', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    --vim.keymap.set('v', '<leader>gh', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', '<leader>gh',
    '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })<CR>', opts)
    -- keymap.set('v', '<leader>vgh', '<cmd>lua vim.diagnostic.open_float(0, { border = "rounded" })<CR>', opts)
    vim.keymap.set('n', '<leader>vk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.keymap.set('n', '<leader>vj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.keymap.set('n', '<leader>k', '<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR})<CR>'
    ,
    opts)
    vim.keymap.set('n', '<leader>j', '<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR})<CR>'
    ,
    opts)
    vim.keymap.set('n', '<leader>vq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    -- vim.keymap.set("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    -- vim.keymap.set("n", "<leader>vf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    -- vim.keymap.set("n", "<c-s>", "<cmd>lua vim.lsp.buf.format()<CR><cmd>lua vim.cmd([[w]])<CR>", opts);

    if client.name == "clangd" then
      vim.keymap.set("n", "<leader>sh", "<cmd>LspClangdShowSymbolInfo<CR>", opts)
      vim.keymap.set("n", "<leader>sf", "<cmd>LspClangdSwitchSourceHeader<CR>", opts)
    end
  end,
})

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
    vim.cmd.normal "i"
  end,
})

-- vim.cmd.colorscheme 'base-16-default-dark'

-- vim.cmd([[
--   colorscheme default
--   highlight Normal guibg=NONE
--   highlight NormalFloat guibg=NONE
--   highlight NormalNC guibg=NONE
-- ]])
