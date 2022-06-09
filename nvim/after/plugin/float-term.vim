#maybe map vim esc too
tnoremap <c-[> <c-\><c-n>
tnoremap <esc> <c-\><c-n>

"toggle
nnoremap <C-t> :FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>

"new terminal in tab
nnoremap <leader>tt :tabnew<CR>:term<CR>

"new
nnoremap <leader>tk :FloatermNew<CR>
tnoremap <C-k> <C-\><C-n>:FloatermNew<CR>

"next
nnoremap <leader>th :FloatermNext<CR>
tnoremap <C-h> <C-\><C-n>:FloatermNext<CR>

"kill
nnoremap <leader>tj :FloatermKill<CR>
tnoremap <C-j> <C-\><C-n>:FloatermKill<CR>

"prev
nnoremap <leader>tl :FloatermPrev<CR>
tnoremap <C-l> <C-\><C-n>:FloatermPrev<CR>


