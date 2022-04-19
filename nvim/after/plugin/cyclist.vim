set list

if !get(g:, 'loaded_cyclist', v:false)
  finish
endif

" set listchars=eol:↲
" set listchars=tab:»·
" set listchars=space:␣
" set listchars=trail:-
" set listchars=extends:☛
" set listchars=precedes:☚
" set listchars=conceal:┊
" set listchars=nbsp:☠

call cyclist#add_listchar_option_set('limited', {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'trail': '·',
        \ 'extends': '<',
        \ 'precedes': '>',
        \ 'conceal': '┊',
        \ 'nbsp': '␣',
        \ })

call cyclist#add_listchar_option_set('busy', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '␣',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })

silent! call cyclist#activate_listchars('busy')
nmap <leader>cyn <Plug>CyclistNext

set nolist
