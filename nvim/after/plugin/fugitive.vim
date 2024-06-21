" Status line
" I think this is really ugly lolssss.
" if !exists('*fugitive#statusline')
"   " set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
"   " set statusline+=%=
"   " set statusline+=%{fugitive#statusline()}
"     set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" endif


cnoreabbrev g Git
cnoreabbrev gopen GBrowse
