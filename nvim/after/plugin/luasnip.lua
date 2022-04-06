lua << EOF

-- if vim.g.snippets ~= "luasnip" then
--   return
-- end

ls.snippets = {
    all = {
        ls.parser.parse_snippet("atask", "[$1]\ncommand=$2\noutput=terminal"),
        },
    }

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.api.nvim_set_keymap({ "i", "s" }, "<c-k>", function()
-- vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.api.nvim_set_keymap({ "i", "s" }, "<c-j>", function()
--vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.api.nvim_set_keymap("i", "<c-l>", function()
--vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

