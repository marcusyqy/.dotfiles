if not vim.g.loaded_telescope then
    return
end

local Remaps = require("marcusyqy.keymap")
local nnoremap = Remaps.nnoremap
local vimfn = Remaps.vimfn

-- hack for windows
if vim.fn.has("win32") == 1 then
    pcall(require('telescope').load_extension, "fzy_native")
else
    pcall(require('telescope').load_extension, "fzf")
end

require("telescope").load_extension("file_browser")
require('telescope').load_extension("project")
-- Fuzzy find over current tasks
-- require('telescope').load_extension("asynctasks")
require("telescope").load_extension("git_worktree")

local lga_actions = require("telescope-live-grep-args.actions")

local actions = require("telescope.actions")


-- local options = {
--    defaults = {
--       vimgrep_arguments = {
--          "rg",
--          "--color=never",
--          "--no-heading",
--          "--with-filename",
--          "--line-number",
--          "--column",
--          "--smart-case",
--       },
--       prompt_prefix = "   ",
--       selection_caret = "  ",
--       entry_prefix = "  ",
--       initial_mode = "insert",
--       selection_strategy = "reset",
--       sorting_strategy = "ascending",
--       layout_strategy = "horizontal",
--       layout_config = {
--          horizontal = {
--             prompt_position = "top",
--             preview_width = 0.55,
--             results_width = 0.8,
--          },
--          vertical = {
--             mirror = false,
--          },
--          width = 0.87,
--          height = 0.80,
--          preview_cutoff = 20,
--       },
--       file_sorter = require("telescope.sorters").get_fuzzy_file,
--       file_ignore_patterns = {
--         "vendor/*",
--         "%.lock",
--         "__pycache__/*",
--         "%.sqlite3",
--         "%.ipynb",
--         "node_modules/*",
--         "%.jpg",
--         "%.jpeg",
--         "%.png",
--         "%.svg",
--         "%.otf",
--         "%.ttf",
--         ".git/",
--         "%.webp",
--         ".dart_tool/",
--         ".github/",
--         ".gradle/",
--         ".idea/",
--         ".settings/",
--         ".vscode/",
--         "__pycache__/",
--         "build/",
--         "env/",
--         "gradle/",
--         "node_modules/",
--         "target/",
--         "%.pdb",
--         "%.dll",
--         "%.class",
--         "%.exe",
--         "%.cache",
--         "%.ico",
--         "%.pdf",
--         "%.dylib",
--         "%.jar",
--         "%.docx",
--         "%.met",
--         "smalljre_*/*",
--         ".vale/",
--       },
--       generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
--       path_display = { "truncate" },
--       winblend = 0,
--       border = {},
--       borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--       -- borderchars = {
--       --   prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
--       --   results = { " " },
--       --   preview = { " " },
--       -- },
--       color_devicons = true,
--       set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
--       file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--       grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--       qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--       -- Developer configurations: Not meant for general override
--       buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
--       mappings = {
--          n = { ["q"] = require("telescope.actions").close },
--       },
--    },
--    preview = {
--        filesize_hook = function(filepath, bufnr, opts)
--            local max_bytes = 10000
--            local cmd = {"head", "-c", max_bytes, filepath}
--            require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
--        end
--    },
--    extensions_list = { "themes", "terms"},
--    extensions = {
--        fzf = {
--             fuzzy = true,                    -- false will only do exact matching
--             override_generic_sorter = true,  -- override the generic sorter
--             override_file_sorter = true,     -- override the file sorter
--             case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--                                                -- the default case_mode is "smart_case"
--        }
--   }
-- }
--
-- -- load extensions
-- pcall(function()
--    for _, ext in ipairs(options.extensions_list) do
--       require("telescope").load_extension(ext)
--    end
-- end)

local previewers = require('telescope.previewers')

local new_maker = function(filepath, bufnr, opts)
    opts = opts or {}

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then return end
        if stat.size > 100000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end

local fb_actions = require "telescope._extensions.file_browser.actions"

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        -- prompt_prefix = " >",
        prompt_prefix = "   ",
        color_devicons = true,
        buffer_previewer_maker = new_maker,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- preview = {
        --     filesize_hook = function(filepath, bufnr, opts)
        --         local max_bytes = 10000
        --         local cmd = { "head", "-c", max_bytes, filepath }
        --         require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
        --     end
        -- },
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    --[[
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
    ]]
})


local function git_branch_private()
    require 'telescope.builtin'.git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end,
        require('telescope.themes').get_dropdown({})
    })
end

--
--  " Using lua functions
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fkb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap("<leader>ps",
    function() require('telescope.builtin').grep_string({ search = vim.fn.input("Find For > ") }) end);

-- Find files using Telescope command-line sugar.

-- local telescope_opts = { previewer = false }
local telescope_opts = {}
nnoremap("<c-p>",
    function() require('telescope.builtin').git_files() end)
nnoremap("<leader>ff",
    function() require('telescope.builtin').find_files() end)
nnoremap("<leader>eps",
    function() require('telescope.builtin').live_grep() end)

nnoremap("<leader>fg", function() require('telescope').extensions.live_grep_args.live_grep_args() end)
nnoremap("<leader>fb", vimfn([[Telescope file_browser]]))
nnoremap("<leader>fh", function() require('telescope.builtin').help_tags() end)
-- nnoremap("<leader>fgc",
--     function() require('telescope.builtin').git_commits(require('telescope.themes').get_dropdown({})) end)
-- nnoremap("<leader>fgb", git_branch_private)
nnoremap("<leader>cmd", function() require('telescope.builtin').commands() end)
-- nnoremap <leader>pp", <cmd>lua require'telescope'.extensions.project.project{}<cr>

-- test for building
-- nnoremap("<leader>to",
--     function() require('telescope').extensions.asynctasks.all(require('telescope.themes').get_dropdown(telescope_opts)) end)
-- nnoremap("<leader>te", vimfn([[e .tasks]]))


-- See `:help telescope.builtin`
vim.keymap.set('n', "<leader>/", function() require("telescope.builtin").lsp_document_symbols() end,
    { desc = "[fs], find document symbols" })
vim.keymap.set('n', "<leader>f?", function() require("telescope.builtin").builtin() end,
    { desc = "[fs], builtin" })
vim.keymap.set('n', "<c-t>", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
    { desc = "[fs], find dynamic workspace symbols" })
vim.keymap.set('n', "<leader>fs", function() require("telescope.builtin").lsp_workspace_symbols() end,
    { desc = "[fs], find workspace symbols" })
vim.keymap.set('n', "<leader>ds", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
    { desc = "[fs], find dynamic workspace symbols" })
vim.keymap.set('n', '<leader>?',
    function() require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({ previewer = false })) end
    ,
    -- function() require('telescope.builtin').oldfiles(require('telescope.themes').get_ivy()) end,
    { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<c-b>',
    function() require('telescope.builtin').buffers(require('telescope.themes').get_ivy()) end,
    { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<c-f>', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- nnoremap("<leader>rr", require('telescope.builtin').lsp_references)
