set winblend=0
set wildoptions=pum
set pumblend=5

let ayucolor="mirage" " for mirage version of theme
let g:marcus_colorscheme = "gruvbox"


" Use NeoSolarized


fun! ColorMyPencils()
    let g:neosolarized_termtrans=1
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    " let g:gruvbox_invert_selection='0'
    set background=dark

    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:marcus_colorscheme])
    else
        colorscheme gruvbox
    endif


    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=none
    "hi CursorLine guibg=none
    "highlight LineNr guifg=#ff8659
    "highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd


    highlight Normal guibg=none
endfun

call ColorMyPencils()

