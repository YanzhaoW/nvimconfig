vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert(require 'keybindings'.cmp()),
    -- Accept currently selected item. If none selected, `select` first item.
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
        { name = 'treesitter' },
    }),
})

cmp.setup.cmdline {
    mapping = cmp.mapping.preset.cmdline({
    })
}
