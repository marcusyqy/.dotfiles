if not vim.g.lspconfig then
    return
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- luasnip setup
local luasnip = require('luasnip')
-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')

lspkind.init({
    -- enables text annotations
    --
    -- default: true
    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'default',
    mode = "symbol_text",
    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = ""
    },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        ['<down>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<up>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        ['<c-n>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<c-p>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
    },
    sources = {
        { name = 'nvim_lsp' },

        -- For vsnip user.
        -- { name = 'vsnip' },
        { name = 'nvim_lua' },

        -- For luasnip user.
        { name = 'luasnip' },

        -- for paths
        { name = 'path' },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = 'buffer', keyword_length = 5 },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            mode = "symbol",
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            menu = ({
                buffer = "[buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                luasnip = "[snippets]",
                path = "[path]"
            })
        })
    },
    experimental = {
        native_menu = false,
        ghost_text = false,
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

local nvim_lsp = require('lspconfig')
local protocol = require 'vim.lsp.protocol'

local on_attach = function(client, bufnr)
    --require'completion'.on_attach();
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', '<leader>vrr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>vgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>vsh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --buf_set_keymap('n', '<leader>gh', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    --buf_set_keymap('v', '<leader>gh', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<leader>gh',
        '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })<CR>', opts)
    -- buf_set_keymap('v', '<leader>vgh', '<cmd>lua vim.diagnostic.open_float(0, { border = "rounded" })<CR>', opts)
    buf_set_keymap('n', '<leader>vk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>vj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>k', '<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR})<CR>'
        ,
        opts)
    buf_set_keymap('n', '<leader>j', '<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR})<CR>'
        ,
        opts)
    buf_set_keymap('n', '<leader>vq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap("n", "<leader>vf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    -- buf_set_keymap("n", "<c-s>", "<cmd>lua vim.lsp.buf.format()<CR><cmd>lua vim.cmd([[w]])<CR>", opts);
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- "cssls", "tailwindcss",
--
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { "svelte", "gopls" } --[[ "astro", "tailwindcss" ]]

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

    -- nvim_lsp.clangd.setup {
    --     on_attach = on_attach,
    --     capabilities = capabilities
    --     cmd={
    --         "clangd",
    --         "--header-insertion=never",
    --         "--compile-commands-dir=${workspaceFolder}/",
    --         "--background-index",
    --         "--suggest-missing-includes",
    --         "--clang-tidy",
    --         "--query-driver=/**/*"
    --     }
    -- }

    -- nvim_lsp.tsserver.setup ({
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --     filetypes = {
    --         "typescript", "typescriptreact", "typescript.tsx"
    --     }
    -- })

    nvim_lsp.lua_ls.setup {
        on_attach = on_attach,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim', "use", "client", "root", "awesome" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    --library = vim.api.nvim_get_runtime_file("", true),
                    library = {
                        ['/usr/share/nvim/runtime/lua'] = true,
                        ['/usr/share/nvim/runtime/lua/lsp'] = true,
                        ['/usr/share/awesome/lib'] = true
                    },
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    nvim_lsp.rust_analyzer.setup({
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = true
                },
            }
        },
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    })
end

--require'completion'.on_attach(client, bufnr)
-- protocol.CompletionItemKind = {
--     '', -- Text
--     '', -- Method
--     '', -- Function
--     '', -- Constructor
--     '', -- Field
--     '', -- Variable
--     '', -- Class
--     'ﰮ', -- Interface
--     '', -- Module
--     '', -- Property
--     '', -- Unit
--     '', -- Value
--     '', -- Enum
--     '', -- Keyword
--     '﬌', -- Snippet
--     '', -- Color
--     '', -- File
--     '', -- Reference
--     '', -- Folder
--     '', -- EnumMember
--     '', -- Constant
--     '', -- Struct
--     '', -- Event
--     'ﬦ', -- Operator
--     '', -- TypeParameter
--   }

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- vim.lsp.diagnostic.on_publish_diagnostics, {
-- severity_sort = true
--}
--)
require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = {
        -- pass options to lspconfig's setup method
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "typescript", "typescriptreact", "typescript.tsx"
        }
    },
})

require("clangd_extensions").setup {
    server = {
        -- options to pass to nvim-lspconfig
        -- i.e. the arguments to require("lspconfig").clangd.setup({})
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
            "clangd",
            "--header-insertion=never",
            "-j=4",
            "--pch-storage=memory",
            "--compile-commands-dir=${workspaceFolder}/",
            "--background-index",
            -- "--clang-tidy",
            "--all-scopes-completion",
            "--query-driver=**"
            --"query-driver=/**/*"
        }
    },
    extensions = {
        -- defaults:
        autoSetHints = true,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            -- Automatically set inlay hints (type hints)
            inline = vim.fn.has("nvim-0.10") == 1,
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
            -- The highlight group priority for extmark
            priority = 100,
        },
        ast = {
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },
            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },

            highlights = {
                detail = "Comment",
            },
        },
        memory_usage = {
            border = "none",
        },
        symbol_info = {
            border = "none",
        },
    },
}

-- Turn on lsp status information
require('fidget').setup()

vim.cmd([[cnoreabbrev vf lua vim.lsp.buf.format()]])
vim.cmd([[cnoreabbrev Vf lua vim.lsp.buf.format()]])
vim.cmd([[cnoreabbrev VF lua vim.lsp.buf.format()]])
