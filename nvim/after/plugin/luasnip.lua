-- if vim.g.snippets ~= "luasnip" then
--   return
-- end


local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")


ls.config.set_config({
    history = true,
    -- Update more often, :h events for more info.
    update_events = "TextChanged,TextChangedI",
    -- Snippets aren't automatically removed if their text is deleted.
    -- `delete_check_events` determines on which events (:h events) a check for
    -- deleted snippets is performed.
    -- This can be especially useful when `history` is enabled.
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "choiceNode", "Comment" } },
            },
        },
    },
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    -- should try this out first
    enable_autosnippets = true,
})

ls.add_snippets(
    "all", {
        s("asynctask", fmt("[{1}]\ncommand={2}\noutput={3}", {
            i(1, "cmd-name"),
            i(2, "cmd"),
            c(3, { t("terminal"), t("quickfix") })
        })
        )
    }
)

ls.add_snippets(
    "cpp", {
        s("cpplog", t("std::cout << \"@MARCUS\" << __FILE__ << \":\" << __LINE__ << \":\" << __FUNCTION__ << std::endl;"))
    }
)

local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
_G.s_tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "<c-k>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<c-k>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<c-j>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<c-j>", "v:lua.s_tab_complete()", { expr = true })
-- vim.api.nvim_set_keymap("i", "<c->", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<c-e>", "<Plug>luasnip-next-choice", {})

