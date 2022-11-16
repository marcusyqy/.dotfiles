
local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "default",
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
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
      "encoding",
      "filetype",
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
  extensions = {'fugitive'}
}

