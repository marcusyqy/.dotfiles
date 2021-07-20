if !exists('g:loaded_telescope') | finish | endif

lua require('telescope').load_extension('fzy_native')

nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Find For > ")})<cr>
" Find files using Telescope command-line sugar.
nnoremap <c-n> <cmd>Telescope file_browser<cr>
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope search_dirs<cr>
nnoremap <leader>fe <cmd>Telescope grep_open_files<cr>
nnoremap <leader>fgf <cmd>Telescope git_files<cr>
nnoremap <leader>fgc <cmd>Telescope git_commits<cr>

" " Using lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
"
nnoremap <leader>-= <cmd>Telescope find_files cwd=~/AppData/Local/nvim<CR>


