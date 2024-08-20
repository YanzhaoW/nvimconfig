local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'tpope/vim-surround',
    'nvim-lua/lsp-status.nvim',
    'nvim-lualine/lualine.nvim',
    'navarasu/onedark.nvim',
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    "nvim-telescope/telescope-file-browser.nvim",
    'tpope/vim-fugitive',
    'kyazdani42/nvim-tree.lua',
    'lewis6991/gitsigns.nvim',

    { 'nvim-telescope/telescope.nvim', opts = {}, dependencies = { 'nvim-lua/plenary.nvim' }, },
    { 'numToStr/comment.nvim',         opts = {}, },
    { 'akinsho/git-conflict.nvim',     opts = {}, version = '*', },
    { 'stevearc/oil.nvim',             opts = {}, },
    "folke/trouble.nvim",

    -- lsp:
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'nvim-lua/lsp-status.nvim',

    { 'ahmedkhalf/project.nvim', config = function() require 'project_nvim'.setup {} end },
    --bufferline
    {
        'romgrk/barbar.nvim',
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            icons = { filetype = { enabled = false } }
        }
    },

    -- cmp:
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip'
        },
    },
})
