if not vim.g.loaded_nvim_treesitter then
  print("Treesitter not loaded")
  return
end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
    disable = {},
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  sync_install = false,
  ensure_installed = "all"
}


-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- {
            --"lua",
            -- "tsx",
            -- "toml",
            -- "fish",
            -- "php",
            -- "json",
            -- "yaml",
            -- "html",
            -- "javascript",
            -- "lua",
            -- "scss",
            -- "c",
            -- "dockerfile",
            -- "rust",
            -- "cpp"
            -- },
-- }


