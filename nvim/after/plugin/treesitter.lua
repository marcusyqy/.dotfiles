if not vim.g.loaded_nvim_treesitter then
    print("Treesitter not loaded")
    return
end

require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
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
    autotag = {
        enable = true,
        filetypes = {
            'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
            'cpp', 'rust', 'c', 'go',
            'rescript',
            'xml',
            'php',
            'markdown',
            'glimmer', 'handlebars', 'hbs'
        },
    },
    sync_install = false,
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'dockerfile', 'tsx', 'html',
        'markdown', "markdown_inline",
        'json' },
}

-- ensure_installed = "all"

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
