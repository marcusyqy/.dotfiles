"
" this file contains the custom behaviour that marcus wants to have for his
" vim configurations


vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

inoremap <C-c> <esc>


nmap <leader>ss :split<Return><C-w>w
nmap <leader>sv :vsplit<Return><C-w>w

nmap <leader>te :tabedit

"resizing windows
nmap <c-w><left> <c-w><
nmap <c-w><right> <c-w>>
nmap <c-w><up> <c-w>+
nmap <c-w><down> <c-w>-

"resizing windows
nmap <c-a-left> <c-w><
nmap <c-a-right> <c-w>>
nmap <c-a-up> <c-w>+
nmap <c-a-down> <c-w>-

"changing windows
nmap <c-left> <c-w>h
nmap <c-right> <c-w>l
nmap <c-up> <c-w>k
nmap <c-down> <c-w>j


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


let g:svelte_preprocessors = ['typescript']

"removing the weird binding that doesn't let me go forward

nnoremap <tab> >>
nnoremap <s-tab> <<

vnoremap <tab> >
vnoremap <s-tab> <

"make Y behave
nnoremap Y y$

"center cursor
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`v

"undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap - -<c-g>u
inoremap ( (<c-g>u
inoremap [ [<c-g>u

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==a
inoremap <C-j> <esc>:m .+1<CR>==a
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap <c-u> <c-i>
