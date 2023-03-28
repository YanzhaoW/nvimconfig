vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
-- Setup nvim-cmp.
local cmp = require 'cmp'
vim.g.cmp_disable_enable_toggle = false

cmp.setup({
    enabled = function()
        return vim.g.cmp_disable_enable_toggle
    end,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    }),
})


cmp.setup.cmdline {
    mapping = cmp.mapping.preset.cmdline({
    })
}
