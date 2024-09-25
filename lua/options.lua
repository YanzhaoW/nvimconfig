vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.backspace = { 'indent', 'start', 'eol' }
vim.opt.scrolloff = 4
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.mouse = 'a'
vim.opt.inccommand = 'nosplit'
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.splitright = true
-- vim.opt.cursorline = true
-- vim.opt.termguicolors = true
vim.opt.pumheight = 15
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.spelloptions = 'noplainbuffer'
vim.opt.signcolumn = 'yes'

if (os.getenv("TMUX") ~= nil) then
    vim.g.clipboard = {
        name = 'tmux clipboard',
        copy = {
            ["+"] = { 'tmux', 'load-buffer', '-' },
            ["*"] = { 'tmux', 'load-buffer', '-' },
        },
        paste = {
            ["+"] = { 'tmux', 'save-buffer', '-' },
            ["*"] = { 'tmux', 'save-buffer', '-' },
        },
        cache_enabled = true,
    }
else
    vim.g.clipboard = {
        name = 'OSC 52',
        copy = {
            ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
            ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
        },
        paste = {
            ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
            ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
        },
    }
end
