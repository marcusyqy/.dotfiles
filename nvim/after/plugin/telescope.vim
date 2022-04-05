if !exists('g:loaded_telescope') | finish | endif

lua << EOF
require("telescope").setup {}

require('telescope').load_extension('fzy_native')
require("telescope").load_extension("file_browser")
require('telescope').load_extension('project')
require('telescope').load_extension('lazygit')
-- Fuzzy find over current tasks
require('telescope').load_extension('asynctasks')




local actions = require('telescope.actions')

-- require('telescope').setup{
--   defaults = {
--     -- Default configuration for telescope goes here:
--     -- config_key = value,
--     mappings = {
--       n = {
--           ['<c-d>'] = require('telescope.actions').delete_buffer
--       }, -- n
--       i = {
--         ["<C-h>"] = "which_key",
--         ['<c-d>'] = require('telescope.actions').delete_buffer
--       } -- i
--     } -- mappings
--   }, -- defaults
-- } -- telescope setup



function git_branch_private()
    require'telescope.builtin'.git_branches({ attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end })
    end
EOF
"
" " Using lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Find For > ")})<cr>
" Find files using Telescope command-line sugar.
" nnoremap <c-n> <cmd>Telescope git_files<cr>
nnoremap <c-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ft <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope search_dirs<cr>
nnoremap <leader>fe <cmd>Telescope grep_open_files<cr>
nnoremap <leader>fgf <cmd>Telescope git_files<cr>
nnoremap <leader>fgc <cmd>Telescope git_commits<cr>
nnoremap <leader>fgb <cmd>lua git_branch_private()<cr>
nnoremap <leader>pp <cmd>lua require'telescope'.extensions.project.project{}<cr>

"test for building
nnoremap <leader>bh <cmd>lua require('telescope').extensions.asynctasks.all()<cr>

autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
" setup mapping to call :LazyGit
nnoremap <leader>lza <cmd>lua require("telescope").extensions.lazygit.lazygit()<CR>

if has('win32')
    nnoremap <leader>-= <cmd>Telescope find_files cwd=~/AppData/Local/nvim<CR>
else
    nnoremap <leader>-= <cmd>Telescope find_files cwd=~/.config/nvim<CR>
endif
