n = require('neosolarized').setup({
    comment_italics = true,
    background_set = true,
})
-- for some reason some code actions get highlighted with WarningMsg and it's too much for me
n.Group.link('WarningMsg', n.groups.Comment)
n.Group.new('TODO', n.colors.blue, n.colors.none, n.styles.underlined + n.styles.bold)
