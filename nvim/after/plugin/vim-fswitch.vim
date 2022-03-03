au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"

au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'

nnoremap <silent> <c-t> :FSHere<cr>
" Extra hotkeys to open header/source in the split
nnoremap <silent> <leader>oh :FSSplitLeft<cr>
nnoremap <silent> <leader>oj :FSSplitBelow<cr>
nnoremap <silent> <leader>ok :FSSplitAbove<cr>
nnoremap <silent> <leader>ol :FSSplitRight<cr>
