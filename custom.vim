"
" this file contains the custom behaviour that marcus wants to have for his
" vim configurations


vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

inoremap <C-c> <esc>

nnoremap <tab> >>
nnoremap <s-tab> <<

vnoremap <tab> >
vnoremap <s-tab> <

nmap <leader>ss :split<Return><C-w>w
nmap <leader>sv :vsplit<Return><C-w>w

nmap <leader>te :tabedit

nmap <C-a> gg<S-v>G

nmap <C-s> <cmd>w<cr>

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

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


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
