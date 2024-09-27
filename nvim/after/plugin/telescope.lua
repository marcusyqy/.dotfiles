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

require('telescope').load_extension("project")

local lga_actions = require("telescope-live-grep-args.actions")
local actions = require("telescope.actions")
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


require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        -- prompt_prefix = " >",
        prompt_prefix = "   ",
        color_devicons = true,
        buffer_previewer_maker = previewers.buffer_previewer_maker,  -- new_maker,
        sorting_strategy = "ascending",
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                --                 preview_width = 0.55,
                -- results_width = 0.8,
                preview_cutoff = 120,
            },
            vertical = {
                mirror = false,
            },
            -- width = 0.87,
            -- height = 0.80,
        },
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
        path_display = { "truncate" }
    },
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

nnoremap("<c-f>",
    function() require('telescope.builtin').grep_string({ search = vim.fn.input("Find For > ") }) end);

local telescope_opts = {}
nnoremap("<c-p>",
    function() require('telescope.builtin').git_files() end)
nnoremap("<leader>ff",
    function() require('telescope.builtin').find_files() end)
nnoremap("<leader>fg",
    function() require('telescope.builtin').live_grep() end)

nnoremap("<leader>ps", function() require('telescope').extensions.live_grep_args.live_grep_args() end)
nnoremap("<leader>fh", function() require('telescope.builtin').help_tags() end)
nnoremap("<leader>cmd", function() require('telescope.builtin').commands() end)

vim.keymap.set('n', "<leader>:", function() require("telescope.builtin").command_history(require('telescope.themes').get_dropdown({previewer=false})) end,
    { desc = "[fs], command history" })

vim.keymap.set('n', "<leader>/", function() require("telescope.builtin").lsp_document_symbols() end,
    { desc = "[fs], find document symbols" })
vim.keymap.set('n', "<leader>f?", function() require("telescope.builtin").builtin() end,
    { desc = "[fs], builtin" })
vim.keymap.set('n', "<leader>fp", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
    { desc = "[fs], find dynamic workspace symbols" })
vim.keymap.set('n', "<leader>fs", function() require("telescope.builtin").lsp_workspace_symbols() end,
    { desc = "[fs], find workspace symbols" })
vim.keymap.set('n', "<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end,
    { desc = "[fs], find dynamic workspace symbols" })
vim.keymap.set('n', '<leader>?',
    function() require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({ previewer = false })) end
    ,
    -- function() require('telescope.builtin').oldfiles(require('telescope.themes').get_ivy()) end,
    { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<c-b>',
    function()
        require('telescope.builtin').buffers(require('telescope.themes').get_ivy({
            attach_mappings = function(_, map)
                map('i', '<c-d>', actions.delete_buffer)
                map('n', '<c-d>', actions.delete_buffer)
                return true
            end,
            previewer = true
        }))
    end,
    { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>s/', function()
        require("telescope.builtin").live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

