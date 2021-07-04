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
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

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
