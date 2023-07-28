local M = {}
-- leading key:
vim.g.mapleader = " " vim.keymap.set('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true, silent = true })

-- telescope:
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fd', function() require('telescope.builtin').diagnostics() end,
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end,
    { noremap = true, silent = true })
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })

-- window navigation:
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

-- trouble:
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set('n', 'tc', ':CmpToggle<CR>', { noremap = true, silent = true })

--keybindings for nvimtree:
vim.keymap.set('n', '<C-x>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>x', ':NvimTreeFocus<CR>')
vim.keymap.set('i', '<C-x>', '<ESC>:NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-x>', '<ESC>:NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>oo', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })


function M.lsp()
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true, buffer = 0 }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format({ async = false }) end, opts)

    vim.keymap.set('n', '<leader>oo', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
end

function M.cmp()
    local cmp = require 'cmp'
    return {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }
end

return M
