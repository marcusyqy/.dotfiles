"
" this file contains the custom behaviour that marcus wants to have for his
" vim configurations

nnoremap <leader>-= :e! ~/AppData/Local/nvim/init.vim<CR>

vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

inoremap <C-c> <esc>

nnoremap <tab> >>
nnoremap <s-tab> <<

vnoremap <tab> >
vnoremap <s-tab> <

"nice removing of whitespaces!
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup AUTO_REMOVE_WHITESPACE_MARCUSYQY
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
