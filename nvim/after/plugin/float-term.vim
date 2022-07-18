"maybe map vim esc too
tnoremap <esc> <c-\><c-n>
tnoremap <c-[> <c-\><c-n>

"toggle
nnoremap <C-t> :FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>

"new terminal in tab
nnoremap <leader>tt :tabnew<CR>:term<CR>a
nnoremap <leader>ts <c-w>s<c-w>j:term<CR>a
nnoremap <leader>tv <c-w>v<c-w>l:term<CR>a

"new
nnoremap <leader>tk :FloatermNew<CR>
tnoremap <C-k> <C-\><C-n>:FloatermNew<CR>

"next
nnoremap <leader>tl :FloatermNext<CR>
tnoremap <C-l> <C-\><C-n>:FloatermNext<CR>

"kill
nnoremap <leader>tj :FloatermKill<CR>
tnoremap <C-j> <C-\><C-n>:FloatermKill<CR>

"prev
nnoremap <leader>th :FloatermPrev<CR>
tnoremap <C-h> <C-\><C-n>:FloatermPrev<CR>


