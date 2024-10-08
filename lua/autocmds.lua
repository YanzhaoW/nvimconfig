-- nvimtree autoclose:
vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local invalid_win = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(invalid_win, w)
            end
        end
        if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
        end
    end
})

vim.api.nvim_create_user_command("InlayToggle", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp", "c", "tex" },
    callback = function() vim.opt_local.makeprg = 'cmake --build ./build --' end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cmake" },
    callback = function() vim.opt_local.makeprg = 'cmake -B ./build -S .' end,
})

