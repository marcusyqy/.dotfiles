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


