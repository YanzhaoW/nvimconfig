local nvim_lsp = require('lspconfig')
local capabilities = require("plugins.capability")

-- Use an on_attach function to only map the following keys
local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    require 'keybindings'.lsp()
end

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,
    ["pyright"] = function()
        nvim_lsp.pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,

    ["clangd"] = function()
        nvim_lsp.clangd.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                settings = require("plugins.clangd")
            }
        }
    end,
    ["lua_ls"] = function()
        nvim_lsp.lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                -- capabilities = capabilities,
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                },
            }
        }
    end,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
    }
)
