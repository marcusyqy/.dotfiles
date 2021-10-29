if !exists('g:loaded_telescope') | finish | endif

lua require('telescope').load_extension('fzy_native')

" " Using lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
"


lua << EOF
local actions = require('telescope.actions')
require'telescope'.load_extension('project')

function git_branch_private()
    require'telescope.builtin'.git_branches({ attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end })
    end
EOF
"

nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Find For > ")})<cr>
" Find files using Telescope command-line sugar.
" nnoremap <c-n> <cmd>Telescope git_files<cr>
nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<cr>
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

if has('win32')
    nnoremap <leader>-= <cmd>Telescope find_files cwd=~/AppData/Local/nvim<CR>
else
    nnoremap <leader>-= <cmd>Telescope find_files cwd=~/.config/nvim<CR>
endif
