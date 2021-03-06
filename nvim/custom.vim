"
" this file contains the custom behaviour that marcus wants to have for his
" vim configurations

let g:svelte_preprocessors = ['typescript']

"removing the weird binding that doesn't let me go forward
inoremap <s-tab> <C-D>

vnoremap <tab> >gv
vnoremap <s-tab> <gv

nnoremap <s-left> <C-w><
nnoremap <s-right> <C-w>>
nnoremap <s-up> <C-w>+
nnoremap <s-down> <C-w>-

vnoremap <leader>p "_dp
vnoremap <leader>P "_dP

nnoremap <leader>fy <cmd>let @+=@%<CR>

"make Y behave
nnoremap Y y$

" yank to buffer
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

"center cursor
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`v

inoremap <c-c> <esc>
noremap <leader>sf <cmd>ClangdSwitchSourceHeader<cr>

"undo breakpoints
" inoremap , ,<c-g>u
" inoremap . .<c-g>u
" inoremap ! !<c-g>u
" inoremap ? ?<c-g>u
" inoremap - -<c-g>u
" inoremap ( (<c-g>u
" inoremap [ [<c-g>u
"
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-k> <esc>:m .-2<CR>==a
" inoremap <C-j> <esc>:m .+1<CR>==a
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==


"nice removing of whitespaces!
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup AUTO_REMOVE_WHITESPACE_MARCUS
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
