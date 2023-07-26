local status, lualine = pcall(require, "lualine")
if (not status) then return end


function searchCount()
    local search = vim.fn.searchcount({maxcount = 0}) -- maxcount = 0 makes the number not be capped at 99
    local searchCurrent = search.current
    local searchTotal = search.total
    if searchCurrent > 0 then
        return "/"..vim.fn.getreg("/").." ["..searchCurrent.."/"..searchTotal.."]"
    else
        return ""
    end
end



lualine.setup {
    options = {
        icons_enabled = true,
        theme = auto, --require("marcusyqy.color").colorscheme,
        -- component_separators = { left = '|', right = '▓'},
        -- section_separators = { left = '▓', right = '▓'},
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},

        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        always_divide_middle = false,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'}, -- 'diagnostics'},
        lualine_c = { {
            "%=%t%m",
            color = {
                gui ="bold"
            }
        }},
        lualine_x = {
            'diff',
            {
                'diagnostics',
                sources = {"nvim_diagnostic"},
                symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
                diagnostics_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError', -- Changes diagnostics' error color.
                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                },
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
            },
            -- { searchCount },
--            'tabs',
            "encoding",
            "filetype",
            "fileformat",
            "require'lsp-status'.status()"
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {'fugitive'}
}
