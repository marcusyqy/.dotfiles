-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
-- local servers = { "clangd", "lua_ls" } -- , "ocaml-lsp" }
--[[ , 'rust_analyzer', 'pyright', 'tsserver', 'lua_ls', 'gopls', "svelte", "astro", "tailwindcss"  }]]
 local servers = { "clangd", "emmet_ls", "lua_ls", "quick_lint_js", "rust_analyzer@2024-10-21", "gopls" }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
    ensure_installed = servers,
}
