set winblend=0
set wildoptions=pum
set pumblend=5

let g:marcus_colorscheme = "gruvbox"

lua << EOF
local catppuccin = require("catppuccin")
local settings = {
    transparent_background = false,
    term_colors = false,
    styles = {
        comments = "italic",
        conditionals = "NONE",
        loops = "NONE",
        functions = "bold",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
        numbers = "italic",
        booleans = "italic",
        properties = "NONE",
        types = "italic",
        operators = "NONE",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "bold,italic",
			hints = "italic",
			warnings = "italic",
			information = "italic",
		},
		underlines = {
			errors = "underlineline",
			hints = "underline",
			warnings = "underline",
			information = "underline",
		},
	},
    coc_nvim = false,
	lsp_trouble = false,
	cmp = true,
	lsp_saga = false,
	gitgutter = false,
	gitsigns = true,
	telescope = true,
	nvimtree = {
		enabled = true,
		show_root = false,
		transparent_panel = false,
	},
	neotree = {
		enabled = false,
		show_root = false,
		transparent_panel = false,
	},
	which_key = false,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = false,
	},
	dashboard = true,
	neogit = false,
	vim_sneak = false,
	fern = false,
	barbar = false,
	bufferline = true,
	markdown = true,
	lightspeed = false,
	ts_rainbow = false,
	hop = false,
	notify = true,
	telekasten = true,
	symbols_outline = true,
}
}

-- configure it
catppuccin.setup(settings)
EOF
let g:vscode_italic_comment = 1
" Vim Script
let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
colorscheme catppuccin

" lua vim.g.one_nvim_transparent_bg = true
" colorscheme one-nvim

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
    " "hi CursorLine guibg=none
    " "highlight LineNr guifg=#ff8659
    " "highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd


    highlight Normal guibg=none
endfun

"call ColorMyPencils()

